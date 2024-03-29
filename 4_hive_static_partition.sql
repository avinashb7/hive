-- Hive partitions are the way to organize table into different parts based on partition keys.
-- By partitioning hive table, query optimization takes place. 
-- The below code demonstrates 2 types of partitions in Hive. 
-- 1) Static partitioning -> We have to mention the partition value while loading the data into the table.
-- 2) Dynamic partition -> We have to mention only the column name for partitioning and Hive will partition the data based on unique keys in the column.


CREATE TABLE sales_static_part (Transaction_date String,
	Product String,
	Price Double,
	Name String,
	City String,
	State String,
	Country String,
	Account_Created String,
	Last_Login String,
	Latitude Double,
	Longitude Double)
PARTITIONED BY (Payment_Type String);


-- Below code snippet is used to insert the data into the statically partitioned table.
-- Important things to note while inserting data is 
---- We have to mention the partition column value like 'PARTITION(payment_type="Visa")'
---- Don't mention the partition column name in SELECT statement
---- Use WHERE clause to mention the column value as alternative.

INSERT INTO TABLE sales_static_part PARTITION(payment_type="Master") SELECT transaction_date,product,price,name,city,state,country,account_created,last_login,latitude,longitude FROM sales_ext;


-- To display the partition values
-- Use your table name in place of 'sales_static_part'

SHOW PARTITIONS sales_static_part;


-- To check/verify the partition column name of the table

DESCRIBE sales_static_part

# Partition Information	 	 
# col_name            	data_type           	comment             
	 	 
payment_type        	string              	     


-- To drop a partition value from the table

ALTER TABLE sales_static_part DROP IF EXISTS PARTITION(payment_type="Master");


