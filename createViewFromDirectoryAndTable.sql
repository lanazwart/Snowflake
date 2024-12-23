create or replace view zenas_athleisure_db.products.PRODUCT_LIST as 
select INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '), '.png')) as product_name
, s.file_name
, s.color_or_style
, s.price
, d.file_url
from directory(@sweatsuits) d
join sweatsuits s
on d.relative_path = s.file_name ;
