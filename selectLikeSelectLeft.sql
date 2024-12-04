select distinct postal_code
from history_day
where country = 'US'
and postal_code like '482%'
or postal_code like '481%' ;

select distinct postal_code
from history_day
where country = 'US'
and left(postal_code, 3) in ('481', '482') ;
