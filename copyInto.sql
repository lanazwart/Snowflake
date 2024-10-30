--Note that we need a virtual warehouse running before the copy into can be made from a Staging area

--Load into table - In Snowflake, position cursor in context of the database / schema you're loading into
copy into order_data
from @staging.external_staging.aws_stage
file_format = (type=‘css’ field_delimeter = ‘|’ skip_header=1 )
Files = (‘orders.csv’);

--Preview first 100 rows of data
select * from order_data limit 100;