#!/bin/sh

source ./conf/credentials.conf

chmod 777 ./baseline.sql
rm ./baseline.sql
rm ./logs/*
mysql --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST -e "DROP USER ${USER_GUEST_NAME}, ${USER_MEMBER_NAME}, ${USER_PRIVILEGED_NAME};"
mysqladmin --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST drop $DATABASE_SCHEMA