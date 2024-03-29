
-- To create the dynamic partition use the below code snippet.
-- Set the below hive properties before adding the data into table.

SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
SET hive.exec.max.dynamic.partitions.pernode = 1000; //Based on requirement and data


CREATE TABLE sales_dynamic_part (Transaction_date String,
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
---- We don't have to mention the partition column value

INSERT INTO sales_dynamic_part PARTITION(payment_type) SELECT * FROM sales_ext;

-- To display the partition values
-- Use your table name in place of 'sales_dynamic_part'

SHOW PARTITIONS sales_dynamic_part;


-- To check/verify the partition column name of the table

DESCRIBE sales_dynamic_part

# Partition Information	 	 
# col_name            	data_type           	comment             
	 	 
payment_type        	string              	     


