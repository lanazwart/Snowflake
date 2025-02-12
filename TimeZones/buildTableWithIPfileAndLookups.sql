select parse_ip('100.41.16.160', 'inet');
select parse_ip('100.41.16.160','inet'):host;
select parse_ip('100.41.16.160','inet'):family;
select parse_ip('100.41.16.160','inet'):ipv4;


--Look up Kishore and Prajina's Time Zone in the IPInfo share using his headset's IP Address with the PARSE_IP function.
select start_ip, end_ip, start_ip_int, end_ip_int, city, region, country, timezone
from IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.DEMO.LOCATION 
where parse_ip('100.41.16.160', 'inet'):ipv4 --Kishore's Headset's IP Address
BETWEEN start_ip_int AND end_ip_int;
--this gives 
-- a start_IP of 100.41.16.158   
--  an end_ip of 100.41.16.160   
-- start_ip_int 1680412830  
-- end_ip_int 1680412832

--Look up everyone's time zone
--Join the log and location tables to add time zone to each row using the PARSE_IP function.
select logs.*
       , loc.city
       , loc.region
       , loc.country
       , loc.timezone
from AGS_GAME_AUDIENCE.RAW.LOGS logs
join IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.demo.location loc
where parse_ip(logs.ip_address, 'inet'):ipv4 
BETWEEN start_ip_int AND end_ip_int;
--this is not an efficient way of finding timezone and ip info


--More efficient way 
--Use two functions supplied by IPShare to help with an efficient IP Lookup Process!
SELECT logs.ip_address
, logs.user_login
, logs.user_event
, logs.datetime_iso8601
, city
, region
, country
, timezone 
from AGS_GAME_AUDIENCE.RAW.LOGS logs
JOIN IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.demo.location loc 
ON IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
AND IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_INT(logs.ip_address) 
BETWEEN start_ip_int AND end_ip_int;

--Add a column called GAME_EVENT_LTZ to the last code block you ran
SELECT logs.ip_address
, logs.user_login
, logs.user_event
, logs.datetime_iso8601
, city
, region
, country
, timezone --this will be the local time zone like 'Africa/Johannesburg'
, CONVERT_TIMEZONE( 'UTC', timezone, logs.datetime_iso8601) as game_event_ltz -- ADD THIS 
from AGS_GAME_AUDIENCE.RAW.LOGS logs
JOIN IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.demo.location loc 
ON IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
AND IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_INT(logs.ip_address) 
BETWEEN start_ip_int AND end_ip_int;


--Use the DAYNAME function to add the DOW ("Day of Week") name as a column to your SELECT.  The new column should be named DOW_NAME. 
--Be sure to use the local time zone datetime value so that you get the day in local time
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
JOIN IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.demo.location loc 
ON IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
AND IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_INT(logs.ip_address) 
BETWEEN start_ip_int AND end_ip_int;

--Add the day of the week  
--Add the time of the day using a lookup table
--wrap it into a table
CREATE TABLE AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED AS
SELECT logs.ip_address
, logs.user_login AS GAMER_NAME
, logs.user_event AS GAME_EVENT_NAME
, logs.datetime_iso8601 GAME_EVENT_UTC
, city
, region
, country
, timezone AS GAMER_LTZ_NAME
, CONVERT_TIMEZONE( 'UTC', timezone, logs.datetime_iso8601) as game_event_ltz
, DAYNAME(game_event_ltz) AS DOW_NAME
, TOD_NAME
from AGS_GAME_AUDIENCE.RAW.LOGS logs
JOIN IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.demo.location loc 
ON IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
AND IPINFO_IP_GEOLOCATION_TRAININGEDUCATION_SAMPLE.public.TO_INT(logs.ip_address) 
BETWEEN start_ip_int AND end_ip_int
JOIN AGS_GAME_AUDIENCE.RAW.TIME_OF_DAY_LU tod_lookup
ON EXTRACT(hour from game_event_ltz) =  tod_lookup.hour;
