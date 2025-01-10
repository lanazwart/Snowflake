--Check your table to see if you loaded it properly
select tod_name, listagg(hour,',') 
from time_of_day_lu
group by tod_name;
