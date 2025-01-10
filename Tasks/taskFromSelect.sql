create task load_logs_enhanced
    warehouse = 'COMPUTE_WH'
    schedule = '5 minute'
    -- <session_parameter> = <value> [ , <session_parameter> = <value> ... ] 
    -- user_task_timeout_ms = <num>
    -- copy grants
    -- comment = '<comment>'
    -- after <string>
  -- when <boolean_expr>
  as
    select 'hello';
