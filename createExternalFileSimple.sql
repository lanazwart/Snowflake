create or replace external table T_CHERRY_CREEK_TRAIL(
	my_filename varchar(100) as (metadata$filename::varchar(100))
) 
location= @external_aws_dlkw --you have to have an external stage for this 
auto_refresh = true
file_format = (type = parquet);
