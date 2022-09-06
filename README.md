# Radicant Challenge

The objective of this challenge was to implement an api that is capable of retrieving and storing data on a RDBMS. It focuses around investment funds (sustainability focused) and user behavior.


## Getting Started

This project was made to run on GCP enviroment. To run this code you'll need a GCP account with billing, APP Engine API and Cloud SQL enabled.
In CloudSQL create a PostgresSQL instance called radicant with public ip (doesn't work with private ip because of cpu quota limits (free version)).
Inside the radicant instance create a database called esgfunds and run the sql scrip PostgresSQL\basic_structure.sql.
Import the data using the cloud console.
Create a AppEngine instance and with the Google Cloud SDK run gcloud app deploy in the app folder.


## Authors

  - **Gustavo Huida Sá Dos Santos**  

## What to do next

Here are some points of improvement to the project:

- Validate fields entering the API
- More and better error messages
- Better documentation
- Using secret manager to store keys
- Implementing more logs beyong what GCP already logs with stack driver

