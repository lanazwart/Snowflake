create or replace secure function vin.decode.parse_and_enhance_vin(this_vin varchar(25))
returns table (
    VIN varchar(25)
    , manuf_name varchar(25)
    , vehicle_type varchar(25)
    , make_name varchar(25)
    , plant_name varchar(25)
    , model_year varchar(25)
    , model_name varchar(25)
    , desc1 varchar(25)
    , desc2 varchar(25)
    , desc3 varchar(25)
    , desc4 varchar(25)
    , desc5 varchar(25)
    , engine varchar(25)
    , drive_type varchar(25)
    , transmission varchar(25)
    , mpg varchar(25)
)
as $$

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
       ( SELECT THIS_VIN as VIN
       , LEFT(THIS_VIN,3) as WMI
       , SUBSTR(THIS_VIN,4,5) as VDS
       , SUBSTR(THIS_VIN,10,1) as model_year_code
       , SUBSTR(THIS_VIN,11,1) as plant_code
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
         AND vds.make_id = m.make_id
 
$$;
