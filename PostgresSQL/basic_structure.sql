CREATE TYPE OperationType AS ENUM ('greater', 'lesser', 'between');
CREATE TYPE SectorType AS ENUM ('fund_sector_basic_materials','fund_sector_communication_services','fund_sector_consumer_cyclical','fund_sector_consumer_defensive','fund_sector_energy',
                    'fund_sector_financial_services','fund_sector_healthcare','fund_sector_industrials','fund_sector_real_estate','fund_sector_technology','fund_sector_utilities');

CREATE TABLE "etfs" (
  "fund_symbol" TEXT,
  "quote_type" TEXT,
  "region" TEXT,
  "fund_short_name" TEXT,
  "fund_long_name" TEXT,
  "currency" TEXT,
  "fund_category" TEXT,
  "fund_family" TEXT,
  "exchange_code" TEXT,
  "exchange_name" TEXT,
  "exchange_timezone" TEXT,
  "avg_vol_3month" REAL,
  "avg_vol_10day" REAL,
  "total_net_assets" REAL,
  "day50_moving_average" REAL,
  "day200_moving_average" REAL,
  "week52_high_low_change" REAL,
  "week52_high_low_change_perc" REAL,
  "week52_high" REAL,
  "week52_high_change" REAL,
  "week52_high_change_perc" REAL,
  "week52_low" REAL,
  "week52_low_change" REAL,
  "week52_low_change_perc" REAL,
  "investment_strategy" TEXT,
  "fund_yield" REAL,
  "inception_date" TEXT,
  "annual_holdings_turnover" REAL,
  "investment_type" TEXT,
  "size_type" TEXT,
  "fund_annual_report_net_expense_ratio" REAL,
  "category_annual_report_net_expense_ratio" REAL,
  "asset_stocks" REAL,
  "asset_bonds" REAL,
  "fund_sector_basic_materials" REAL,
  "fund_sector_communication_services" REAL,
  "fund_sector_consumer_cyclical" REAL,
  "fund_sector_consumer_defensive" REAL,
  "fund_sector_energy" REAL,
  "fund_sector_financial_services" REAL,
  "fund_sector_healthcare" REAL,
  "fund_sector_industrials" REAL,
  "fund_sector_real_estate" REAL,
  "fund_sector_technology" REAL,
  "fund_sector_utilities" REAL,
  "fund_price_book_ratio" REAL,
  "fund_price_cashflow_ratio" REAL,
  "fund_price_earning_ratio" REAL,
  "fund_price_sales_ratio" REAL,
  "fund_bond_maturity" REAL,
  "fund_bond_duration" REAL,
  "fund_bonds_us_government" REAL,
  "fund_bonds_aaa" REAL,
  "fund_bonds_aa" REAL,
  "fund_bonds_a" REAL,
  "fund_bonds_bbb" REAL,
  "fund_bonds_bb" REAL,
  "fund_bonds_b" REAL,
  "fund_bonds_below_b" REAL,
  "fund_bonds_others" REAL,
  "top10_holdings" TEXT,
  "top10_holdings_total_assets" REAL,
  "returns_as_of_date" TEXT,
  "fund_return_ytd" REAL,
  "category_return_ytd" REAL,
  "fund_return_1month" REAL,
  "category_return_1month" REAL,
  "fund_return_3months" REAL,
  "category_return_3months" REAL,
  "fund_return_1year" REAL,
  "category_return_1year" REAL,
  "fund_return_3years" REAL,
  "category_return_3years" REAL,
  "fund_return_5years" REAL,
  "category_return_5years" REAL,
  "fund_return_10years" REAL,
  "category_return_10years" REAL,
  "years_up" REAL,
  "years_down" REAL,
  "fund_return_2020" REAL,
  "category_return_2020" REAL,
  "fund_return_2019" REAL,
  "category_return_2019" REAL,
  "fund_return_2018" REAL,
  "category_return_2018" REAL,
  "fund_return_2017" REAL,
  "category_return_2017" REAL,
  "fund_return_2016" REAL,
  "category_return_2016" REAL,
  "fund_return_2015" REAL,
  "category_return_2015" REAL,
  "fund_return_2014" REAL,
  "category_return_2014" REAL,
  "fund_return_2013" REAL,
  "category_return_2013" REAL,
  "fund_return_2012" REAL,
  "category_return_2012" REAL,
  "fund_return_2011" REAL,
  "category_return_2011" REAL,
  "fund_return_2010" REAL,
  "category_return_2010" REAL,
  "fund_return_2009" REAL,
  "category_return_2009" REAL,
  "fund_return_2008" REAL,
  "category_return_2008" REAL,
  "fund_return_2007" REAL,
  "category_return_2007" REAL,
  "fund_return_2006" REAL,
  "category_return_2006" REAL,
  "fund_return_2005" REAL,
  "category_return_2005" REAL,
  "fund_return_2004" REAL,
  "category_return_2004" REAL,
  "fund_return_2003" REAL,
  "category_return_2003" REAL,
  "fund_return_2002" REAL,
  "category_return_2002" REAL,
  "fund_return_2001" REAL,
  "category_return_2001" REAL,
  "fund_return_2000" REAL,
  "category_return_2000" REAL,
  "fund_alpha_3years" REAL,
  "fund_beta_3years" REAL,
  "fund_mean_annual_return_3years" REAL,
  "fund_r_squared_3years" REAL,
  "fund_stdev_3years" REAL,
  "fund_sharpe_ratio_3years" REAL,
  "fund_treynor_ratio_3years" REAL,
  "fund_alpha_5years" REAL,
  "fund_beta_5years" REAL,
  "fund_mean_annual_return_5years" REAL,
  "fund_r_squared_5years" REAL,
  "fund_stdev_5years" REAL,
  "fund_sharpe_ratio_5years" REAL,
  "fund_treynor_ratio_5years" REAL,
  "fund_alpha_10years" REAL,
  "fund_beta_10years" REAL,
  "fund_mean_annual_return_10years" REAL,
  "fund_r_squared_10years" REAL,
  "fund_stdev_10years" REAL,
  "fund_sharpe_ratio_10years" REAL,
  "fund_treynor_ratio_10years" REAL,
CONSTRAINT PK_ETFS PRIMARY KEY (fund_symbol)
);

CREATE TABLE "clientfilters" (
    "clientid" int,
    "type" OperationType,
    "value1" bigint,
    "value2" bigint,
    "sector" SectorType,
    );