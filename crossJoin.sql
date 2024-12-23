-- use this to create a cartesian product
-- each row from the first table is combined with every row from the second table
select * 
from product_list p
cross join sweatsuit_sizes;

-- use case would be to create a catalog  
create or replace view zenas_athleisure_db.products. PRODUCT_LIST as 
select * 
from product_list p
cross join sweatsuit_sizes;
