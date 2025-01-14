create or replace task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES
	warehouse=COMPUTE_WH
	schedule='10 minute'
	as copy into  AGS_GAME_AUDIENCE.RAW.PL_GAME_LOGS
    from @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE 
    file_format = (format_name=AGS_GAME_AUDIENCE.RAW.FF_JSON_LOGS);
