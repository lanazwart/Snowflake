--Check schema names
select * 
from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 

--Check number of schemas using the INFORMATION_SCHEMA
select count(*) as schemas_found, '3' as schemas_expected 
from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 
