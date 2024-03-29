-- INTERNAL OR MANAGED TABLE
-- Use the below command to create INTERNAL table
-- Download 'SalesJan2009.csv'

CREATE TABLE sales_table (Transaction_date String,
	Product String,
	Price Double,
	Payment_Type String,
	Name String,
	City String,
	State String,
	Country String,
	Account_Created String,
	Last_Login String,
	Latitude Double,
	Longitude Double)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

-- Check if the table is created
SHOW TABLES;

-- Check the schema of the table
DESCRIBE sales_table;

-- Load data into the table 
LOAD DATA LOCAL INPATH '/home/training/Desktop/SalesJan2009.csv' INTO TABLE sales_table;

-- Validate if the data is loaded into table
-- The below command will spin up 1 mapper and 1 reducer
SELECT COUNT(*) FROM sales_table;

-- Check the table content using below command
-- The below command will not launch mappers and reducers
SELECT * FROM sales_table LIMIT 5;

-- Drop INERNAL table
-- Note, when you drop the internal table, HIVE will delete the data permanently from '/user/hive/warehouse/' along with metadata
DROP TABLE sales_table;

-- To store the data into PARQUET format, create table in the above mentioned procedure and load the data into parquet file using the below procedure

CREATE TABLE sales_parquet (Transaction_date String,
	Product String,
	Price Double,
	Payment_Type String,
	Name String,
	City String,
	State String,
	Country String,
	Account_Created String,
	Last_Login String,
	Latitude Double,
	Longitude Double)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS parquet;

-- Write the data from 'sales_table' to 'sales_parquet'
INSERT OVERWRITE TABLE sales_parquet SELECT * FROM sales_table;



