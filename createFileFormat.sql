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
