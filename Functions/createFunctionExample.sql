--THERE ARE 2 WAYS TO CREATE A FUNCTION

--ONE
create OR replace function sum_mystery_bag_vars(var1 NUMBER, var2 NUMBER, var3 NUMBER)
returns NUMBER AS 'SELECT var1 + var2 + var3';

--use this function
select sum_mystery_bag_vars(12,36,204);


--TWO
set var1 = 12;
set var2 = 67.2;
set var3 -39;

--use this function
select sum_mystery_bag_vars($var1, $var2, $var3) ;

--THIS IS A SNOWFLAKE FUNCTION
create OR replace function util_db.public.neutralize_whining(var1 varchar)
returns varchar AS 'SELECT initcap(var1)';

--use the function
set var1 = 'wHy ArE yOu LIKE this?' ;
select neutralize_whining($var1) ;
