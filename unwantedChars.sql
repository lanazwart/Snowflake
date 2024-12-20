--a file format get rid of extra spaces
create or replace file format zmd_file_format_1
RECORD_DELIMITER = ';'
TRIM_SPACE = TRUE ;

--to get rid of CRLF characters as they can't be fixed with a file format parm
select REPLACE($1,chr(13)||chr(10)) as sizes_available
from @product_metadata/sweatsuit_sizes.txt
(file_format => zmd_file_format_1)
where sizes_available <> '';
