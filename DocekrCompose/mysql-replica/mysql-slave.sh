#!/bin/bash
sql_set_master="CHANGE MASTER TO MASTER_HOST='database_master',MASTER_USER='mydb_slave_user',MASTER_PASSWORD='mydb_slave_pwd',MASTER_LOG_FILE='$CURRENT_LOG',MASTER_LOG_POS=$CURRENT_POS; START SLAVE;"

start_slave_cmd='mysql -u root -pS3cret -e "'

start_slave_cmd+="$sql_set_master"

start_slave_cmd+='"'

docker exec mysql56-slave-galaxy1 sh -c "$start_slave_cmd"

docker exec mysql56-slave-galaxy1 sh -c "mysql -u root -pS3cret -e 'SHOW SLAVE STATUS \G'"