-- You cannot give access to functions through the dashboard / FE. It has to be the following SQL.
grant usage 
on function UTIL_DB.PUBLIC.GRADER(VARCHAR, BOOLEAN, NUMBER, NUMBER, VARCHAR) 
to SYSADMIN;
