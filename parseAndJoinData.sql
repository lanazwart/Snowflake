 --create a variable and set the value
set sample_vin = 'SAJAJ4FX8LCP55916';

--check to make sure you set the variable above
select $sample_vin;

--parse the vin into it's important pieces
SELECT $sample_vin as VIN
  , LEFT($sample_vin,3) as WMI
  , SUBSTR($sample_vin,4,5) as VDS
  , SUBSTR($sample_vin,10,1) as model_year_code
  , SUBSTR($sample_vin,11,1) as plant_code
;
---use the variable to parse the rest of the data from the joined tables
select VIN
, manuf_name
, vehicle_type
, make_name
, plant_name
, model_year_name as model_year
, model_name
, desc1
, desc2
, desc3
, desc4
, desc5
, engine
, drive_type
, transmission
, mpg
from
  ( SELECT $sample_vin as VIN
  , LEFT($sample_vin,3) as WMI
  , SUBSTR($sample_vin,4,5) as VDS
  , SUBSTR($sample_vin,10,1) as model_year_code
  , SUBSTR($sample_vin,11,1) as plant_code
  ) vin
JOIN vin.decode.wmi_to_manuf w 
    ON vin.wmi = w.wmi
JOIN vin.decode.manuf_to_make m
    ON w.manuf_id=m.manuf_id
JOIN vin.decode.manuf_plants p
    ON vin.plant_code=p.plant_code
    AND m.make_id=p.make_id
JOIN vin.decode.model_year y
    ON vin.model_year_code=y.model_year_code
JOIN vin.decode.make_model_vds vds
    ON vds.vds=vin.vds 
    AND vds.make_id = m.make_id;
