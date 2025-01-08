-- before loading your file, check if the stage and file format are correct
select $1
from @uni_kishore/kickoff
(file_format => ff_json_logs);
