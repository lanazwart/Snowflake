--example 1
create or replace table GARDEN_PLANTS.VEGGIES.LU_SOIL_TYPE(
SOIL_TYPE_ID number,	
SOIL_TYPE varchar(15),
SOIL_DESCRIPTION varchar(75)
 );

--example 2
create or replace table ROOT_DEPTH (
   ROOT_DEPTH_ID number(1), 
   ROOT_DEPTH_CODE text(1), 
   ROOT_DEPTH_NAME text(7), 
   UNIT_OF_MEASURE text(2),
   RANGE_MIN number(2),
   RANGE_MAX number(2)
   ); 

--example 3
create or replace table GARDEN_PLANTS.VEGGIES.VEGETABLE_DETAILS (
	PLANT_NAME VARCHAR(25),
	ROOT_DEPTH_CODE VARCHAR(1)
);

create or replace table GARDEN_PLANTS.VEGGIES.VEG_PLANT_HEIGHT
PLANT_NAME varhar (25),	
UOM  varchar(1),
LOW_END_OF_RANGE number(2),
HIGH_END_OF_RANGE number(2)
 );
