-- use this to create a cartesian product
-- each row from the first table is combined with every row from the second table
select * 
from product_list p
cross join sweatsuit_sizes;
