#!/bin/sh

source ./conf/credentials.conf

chmod 777 ./baseline.sql
rm ./baseline.sql
rm ./logs/*
mysqladmin --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST drop $DATABASE_SCHEMA