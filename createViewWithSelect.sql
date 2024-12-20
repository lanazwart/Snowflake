create view intl_db.public.NATIONS_SAMPLE_PLUS_ISO 
( iso_country_name
  ,country_name_official
  ,alpha_code_2digit
  ,region) AS
  <put select statement here>
;
--examples
--SIMPLE
create view intl_db.public.simple_currency
( cty_code
  ,cur_code )
   AS
  select COUNTRY_CHAR_CODE, CURRENCY_CHAR_CODE  from  INTL_DB.PUBLIC.COUNTRY_CODE_TO_CURRENCY_CODE 
;

--NAMING FIELDS AND GETTING RID OF CRLF chars in the input file
create view zenas_athleisure_db.products.SWEATBAND_PRODUCT_LINE 
( product_code
  ,headband_description
  ,wristband_description)
as 
select REPLACE($1,chr(13)||chr(10)),REPLACE($2,chr(13)||chr(10)), REPLACE($3,chr(13)||chr(10)) as products_available
from @product_metadata/swt_product_line.txt
(file_format => zmd_file_format_2)
where products_available <> '';
