--for when there are many files in the stage, specify the file name
copy into GARDEN_PLANTS.VEGGIES.LU_SOIL_TYPE 
from @util_db.public.my_internal_stage
files = ('LU_SOIL_TYPE.tsv')
file_format = (format_name=GARDEN_PLANTS.VEGGIES.L9_CHALLENGE_FF);

--for when there is just one file - snowflake will automatically load all files if you don't specify a file name
copy into ags_game_audience.raw.game_logs
from @uni_kishore/kickoff
file_format = (format_name=FF_JSON_LOGS);
