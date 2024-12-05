--example 1 
create file format "Myformatfile" 
type CSV  --can be CSV (structured) or unstructured data types like JSON, Avro, Parquet, Orc and XML
--File type Modifiers
FIELD_DELIMETER = '|'
SKIP_HEADER = 2;

--example 2 - when separated by tabs
create file format GARDEN_PLANTS.VEGGIES.L9_CHALLENGE_FF
    type = 'CSV'--csv is used for any flat file (tsv, pipe-separated, etc)
    field_delimiter = '\t' --tab / whitespace as column separators
    record_delimiter = '\n' --end of line character  
    skip_header = 1 --one header row to skip
    ;


--example 3 - when there is a comma in the data, but the fields contain double quotes" 
create file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW 
    TYPE = 'CSV'--csv for comma separated files
    FIELD_DELIMITER = ',' --commas as column separators
    SKIP_HEADER = 1 --one header row  
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
    ;

--example 4 - when the file and the table that we're loading into have a different number of columns
-- This file format will allow the 3 column file to be loaded into an 18 column table
-- By parsing the header, Snowflake can infer the column names
CREATE FILE FORMAT util_db.public.CSV_COL_COUNT_DIFF 
type = 'CSV' 
field_delimiter = ',' 
record_delimiter = '\n' 
field_optionally_enclosed_by = '"'
trim_space = TRUE
error_on_column_count_mismatch = FALSE
parse_header = TRUE;
