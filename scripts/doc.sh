source ./conf/credentials.conf

java -jar schemaSpy_5.0.0.jar -t mysql -u $USER_OWNER_NAME -p $USER_OWNER_PASSWORD -db $DATABASE_SCHEMA -host $HOST:$PORT -o /tmp/schemaSpy_5docs -dp $CONNECTOR_J -hq -norows
git checkout --orphan gh-pages
mv /tmp/schemaSpy_5docs/* .
git add *
git commit -a -m "$1"
git push -u hub gh-pages:gh-pages
git checkout master