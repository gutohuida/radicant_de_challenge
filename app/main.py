import os

import sqlalchemy
from sqlalchemy import text
from flask import Flask, jsonify, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)


def connect_unix_socket() -> sqlalchemy.engine.base.Engine:
    # Note: Saving credentials in environment variables is convenient, but not
    # secure - consider a more secure solution such as
    # Cloud Secret Manager (https://cloud.google.com/secret-manager) to help
    # keep secrets safe.
    db_user = os.environ["DB_USER"]  # e.g. 'my-database-user'
    db_pass = os.environ["DB_PASS"]  # e.g. 'my-database-password'
    db_name = os.environ["DB_NAME"]  # e.g. 'my-database'
    unix_socket_path = os.environ["INSTANCE_UNIX_SOCKET"]  # e.g. '/cloudsql/project:region:instance'

    pool = sqlalchemy.create_engine(
        f'postgresql+pg8000://{db_user}:{db_pass}@/{db_name}?unix_sock={unix_socket_path}/.s.PGSQL.5432',       
        pool_size=5,
        max_overflow=2,
        pool_timeout=30,  # 30 seconds
        pool_recycle=1800,  # 30 minutes
    )
    return pool

#to improve: Logs, validation of fields, error msgs, keys, separete code, git organizarion, documentation, parametrization


class Esgfunds(Resource):

    def get(self):

        args = request.args
        type = args.get('type')
        value1 = args.get('value1')
        value2 = args.get('value2')
        sector = args.get('sector')

        fields = ['fund_symbol','fund_long_name','exchange_name','inception_date','total_net_assets','fund_yield','fund_alpha_5years','fund_beta_5years']
        sectors = ['fund_sector_basic_materials','fund_sector_communication_services','fund_sector_consumer_cyclical','fund_sector_consumer_defensive','fund_sector_energy',
                    'fund_sector_financial_services','fund_sector_healthcare','fund_sector_industrials','fund_sector_real_estate','fund_sector_technology','fund_sector_utilities']

        query = str()

        if type == 'greater':
            query = f"total_net_assets > {value1}"
        elif type == 'lesser':
            query =  f"total_net_assets < {value1}"
        elif type == 'between':
            query =  f"total_net_assets between {value1} and {value2}"       

        if sector:
            fields.append(sector)
            query_greatest = f"greatest({', '.join(sectors)}) = {sector}"
            query = query + " and " + query_greatest if query else query_greatest
      
        try:
            engine = connect_unix_socket()
            with engine.connect() as connection:
                resultproxy = connection.execute(f"select {', '.join(fields)} from etfs where {query}")

            return jsonify({'result': [dict(row) for row in resultproxy]})

        except Exception as e:
            return {'message':str(e)}    


    def post(self):
        args = request.args
        clientid = args.get('clientid') 
        type = args.get('type') #or "Null"
        value1 = args.get('value1') #or "Null"
        value2 = args.get('value2') #or "Null"
        sector = args.get('sector') #or "Null"

        
        try:
            engine = connect_unix_socket()
            with engine.connect() as connection:
                data = ( { "clientid": clientid, "type": type, "value1": value1, "value2":value2, "sector":sector} )

                statement = text("""INSERT INTO clientfilters(clientid, type, value1, value2, sector) VALUES(:clientid, :type, :value1, :value2, :sector)""")

                connection.execute(statement, data)
                
            return {'status':'ok'}, 200    

        except Exception as e:
            return {'message':str(e)}


api.add_resource(Esgfunds, '/esgfunds')  # add endpoints

if __name__ == '__main__':
    app.run()  # run our Flask app






