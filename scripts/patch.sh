#!/bin/sh

chmod 644 ./baseline.sql
mysqldump  --user=$USER_OWNER_NAME --password=$USER_OWNER_PASSWORD --host=$HOST --no-data > ./baseline.sql $DATABASE_SCHEMA 