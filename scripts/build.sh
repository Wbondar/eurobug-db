#!/bin/sh

source ./conf/domains.conf
source ./conf/credentials.conf
TEMPLATE='/tmp/$USEReurobug.txt'

touch $TEMPLATE

echo 'START TRANSACTION;' >> $TEMPLATE
cat ./tables/* ./sequences/* ./triggers/* ./views/* ./routines/* ./users/* >> $TEMPLATE
echo 'COMMIT;' >> $TEMPLATE

BASELINE=./baseline.sql
touch $BASELINE
chmod 644 $BASELINE
eval "echo \"$(< $TEMPLATE)\"" > $BASELINE
chmod 444 $BASELINE

rm $TEMPLATE