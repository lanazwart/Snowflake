/*Sample code for creating a database, schema and stage in Snowflake

Create some structure DB. Schema, external stage s3://tableautim-snow/yt-datasets/ */
Create or replace database staging ;

Create or replace schema external_staging;

Create or replace stage aws_stage
url=‘s3://tableautim-snowflake/linkedin/';

Desc stage aws_stage;

List @aws_tage;

/* Load data into stage from S3 //Preview the data in the stage */
Select t.$1, t.$2 from @aws_stage t;

Create or replace file format csv_comma type= ‘csv’ field_delimeter= ‘|’ skip_header=1;

/* Create a table to load data into */ 
create table ORDER_DATA(
DAYS_TO_DISPATCH integer(4),
YEARS_OF_SALE integer(4),
RETURNED varchar(3),
RETURN_NOTES varchar(500),
APPROVER varchar(100), 
STATE_PROVINCE varchar(100),
SALES_REGION varchar(100))
; 

//  ETC - this is the whole table definition 
