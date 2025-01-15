--Use this command if your Snowpipe seems like it is stalled out:
ALTER PIPE ags_game_audience.raw.PIPE_GET_NEW_FILES REFRESH;

--Use this command if you want to check that your pipe is running:
select parse_json(SYSTEM$PIPE_STATUS( 'ags_game_audience.raw.PIPE_GET_NEW_FILES' ));
