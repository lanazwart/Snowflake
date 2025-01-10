-- reading a marketplace file containing data for IP addresses to find the physical location of where a date in a log comes from
-- used to find where a user is logging in from - won't work 100 as some people use VPNs

SELECT logs.ip_address
, logs.user_login
, logs.user_event
, logs.datetime_iso8601
, city
, region
, country
, timezone 
, CONVERT_TIMEZONE( 'UTC', timezone, logs.datetime_iso8601) as game_event_ltz
from AGS_GAME_AUDIENCE.RAW.LOGS logs
JOIN IPINFO_IP_GEOLOCATION.demo.location loc 
ON IPINFO_IP_GEOLOCATION.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
AND IPINFO_IP_GEOLOCATION.public.TO_INT(logs.ip_address) 
BETWEEN start_ip_int AND end_ip_int;
