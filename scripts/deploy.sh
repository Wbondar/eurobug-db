#!/bin/sh

source ./conf/credentials.conf

mysqladmin --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST create $DATABASE_SCHEMA
mysql --verbose --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST < ./baseline.sql >> ./logs/deployment.log $DATABASE_SCHEMA