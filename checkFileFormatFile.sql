select $1, $2, $3, $4
from @util_db.public.my_internal_stage/VEG_PLANT_HEIGHT.csv
(file_format => garden_plants.veggies.VEG_PLANT_HEIGHT_FF ); 
