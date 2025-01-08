copy into GARDEN_PLANTS.VEGGIES.LU_SOIL_TYPE 
from @util_db.public.my_internal_stage
files = ('LU_SOIL_TYPE.tsv')
file_format = (format_name=GARDEN_PLANTS.VEGGIES.L9_CHALLENGE_FF);
