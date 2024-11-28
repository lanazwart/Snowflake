create view intl_db.public.NATIONS_SAMPLE_PLUS_ISO 
( iso_country_name
  ,country_name_official
  ,alpha_code_2digit
  ,region) AS
  <put select statement here>
;
--example
create view intl_db.public.simple_currency
( cty_code
  ,cur_code )
   AS
  select COUNTRY_CHAR_CODE, CURRENCY_CHAR_CODE  from  INTL_DB.PUBLIC.COUNTRY_CODE_TO_CURRENCY_CODE 
;
