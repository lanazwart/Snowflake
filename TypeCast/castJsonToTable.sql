-- this is with key value pairs in the JSON called agent, datetime_iso8601, user_event, user_login and then raw log data

select 
RAWLOG:agent::text as AGENT
, RAWLOG:datetime_iso8601::text AS TIMESTAMP_NTZ 
, RAWLOG:user_event::text as USER_EVENT
, RAWLOG:user_login::text as USER_LOGIN
, *
from game_logs ;
