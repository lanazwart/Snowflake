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

