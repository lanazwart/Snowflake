--The default value for each setting is FALSE. To load the file data into separate rows, one of the values will need to be set to TRUE

create file format library_card_catalog.public.json_file_format
type = 'JSON' 
compression = 'AUTO' 
enable_octal = FALSE
allow_duplicate = TRUE
strip_outer_array = TRUE
strip_null_values = FALSE
ignore_utf8_errors = FALSE; 
