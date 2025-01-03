---when your input is stored in a geographic object
CREATE OR REPLACE FUNCTION distance_to_mc(lng_and_lat GEOGRAPHY)
  RETURNS FLOAT
  AS
  $$
   st_distance(
        st_makepoint('-104.97300245114094','39.76471253574085')
        ,lng_and_lat
        )
  $$
  ;
--using the function above
select
 NAME
 , COORDINATES
 , st_distance(
   st_makepoint('-104.97300245114094','39.76471253574085'), COORDINATES
 ) 
as DISTANCE_TO_MELANIES
from  OPENSTREETMAP_DENVER.DENVER.V_OSM_DEN_SHOP_OUTDOORS_AND_SPORT_VEHICLES
where SHOP  = 'bicycle'
order by DISTANCE_TO_MELANIES;
