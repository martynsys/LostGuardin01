#!/bin/bash
sql_slave_user='CREATE USER "slave_user"@"%" IDENTIFIED BY "test100test"; GRANT REPLICATION SLAVE ON *.* TO "slave_user"@"%"; FLUSH PRIVILEGES;'

docker exec mysql56-master-galaxy sh -c "mysql -u root -ptest100test -e '$sql_slave_user'"

MS_STATUS=`docker exec mysql56-master-galaxy sh -c 'mysql -u root -ptest100test -e "SHOW MASTER STATUS"'`

CURRENT_LOG=`echo $MS_STATUS | awk '{print $6}'`

CURRENT_POS=`echo $MS_STATUS | awk '{print $7}'`
