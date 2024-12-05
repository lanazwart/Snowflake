--remember that for copy into, we need a table to load into, a staging area, a file to load from and a file format file

--this is a reminder of how you create an external AWS staging area
create stage util_db.public.aws_s3_bucket url = 's3://uni-cmcw';

--this is a reminder of how you create a file format file
create or replace file format util_db.public.PIPE_DBLQUOTE_HEADER_CR 
  type = 'CSV' --use CSV for any flat file
  compression = 'AUTO' 
  field_delimiter = '|' --pipe or vertical bar
  record_delimiter = '\r' --carriage return
  skip_header = 1  --1 header row
  field_optionally_enclosed_by = '\042'  --double quotes
  trim_space = FALSE;

-- list the files in the S3 bucket
list @util_db.public.aws_s3_bucket;

-- check the spelling of the file on AWS with the above command - AWS is case sensitive so make sure the file name is correct
copy into intl_db.public.int_stds_org_3166
from @util_db.public.AWS_S3_BUCKET    --this is the external S3 staging area
files = ('ISO_Countries_UTF8_pipe.csv')  --this is the file on AWS
file_format = ( format_name='UTIL_DB.PUBLIC.PIPE_DBLQUOTE_HEADER_CR' ); 

--a special copy into 
-- With a parsed header, Snowflake can MATCH BY COLUMN NAME during the COPY INTO
copy into stock.unsold.lotstock
from @stock.unsold.aws_s3_bucket/Lotties_LotStock_Data.csv
file_format = (format_name = util_db.public.csv_col_count_diff)
match_by_column_name='CASE_INSENSITIVE';
