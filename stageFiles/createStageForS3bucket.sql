--If you want to use SQL and not the Wizard
create stage util_db.public.aws_s3_bucket url = 's3://uni-cmcw';

--The file you will be loading is called iso_countries_utf8_pipe.csv. BUT remember that AWS is very case sensitive, 
--so be sure to look up the EXACT spelling of the file name for your COPY INTO statement. 
--Remember that you can view the files in the stage either by navigating to the stage and enabling the directory table, or by running a list command like this: 

list @util_db.public.aws_s3_bucket;
