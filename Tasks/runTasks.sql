--Grant serverless task management to sysadmin
use role accountadmin;
grant EXECUTE MANAGED TASK on account to SYSADMIN;

--switch back to sysadmin
use role sysadmin;

--Replace the WAREHOUSE property in your tasks
-- put this in the actual task USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
