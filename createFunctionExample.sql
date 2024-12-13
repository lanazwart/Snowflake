--Two ways of creating a function

--1
create OR replace function sum_mystery_bag_vars(var1 NUMBER, var2 NUMBER, var3 NUMBER)
returns NUMBER AS 'SELECT var1 + var2 + var3';
--use this function
select sum_mystery_bag_vars(12,36,204);

-- OR 

--2
set var1 = 12;
set var2 = 67.2;
set var3 -39;
--use this function
select sum_mystery_bag_vars($var1, $var2, $var3)


-- this was for the integration with the accreditation tool (the one that generates badges) 
use role accountadmin;  

create or replace external function util_db.public.grader(
      step varchar
    , passed boolean
    , actual integer
    , expected integer
    , description varchar)
returns variant
api_integration = dora_api_integration 
context_headers = (current_timestamp, current_account, current_statement, current_account_name) 
as 'https://awy6hshxy4.execute-api.us-west-2.amazonaws.com/dev/edu_dora/grader'
; 

--Check that the function is working
use role accountadmin;
use database util_db; 
use schema public; 

select grader(step, (actual = expected), actual, expected, description) as graded_results from
(SELECT 
 'DORA_IS_WORKING' as step
 ,(select 123) as actual
 ,123 as expected
 ,'Dora is working!' as description
); 
