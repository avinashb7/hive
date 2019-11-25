-- Create table with timestamp
CREATE TABLE time_sample(id Int,
	name String,
	doj timestamp) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',';

-- Load data into the table
LOAD DATA LOCAL INPATH '/home/training/Desktop/time_sample.txt' INTO TABLE time_sample;

--We need to convert the time field to YYYY-MM-DD to be able to work with hive timestamp;

--Get next 15 days records from current date.
SELECT * FROM time_sample WHERE DATEDIFF(current_date,doj) > -15 AND DATEDIFF(current_date,doj) < 0;

SELECT * FROM time_sample WHERE doj BETWEEN '2019-02-01 00:00:00' AND '2019-03-01 00:00:00';

