#!/bin/sh

source ./conf/domains.conf
source ./conf/credentials.conf
TEMPLATE=./template.sql
BASELINE=./baseline.sql


echo '' > $TEMPLATE
echo "START TRANSACTION;SET sql_mode='ANSI_QUOTES';" >> $TEMPLATE
cat ./tables/* ./sequences/* ./views/* ./routines/* ./triggers/* ./users/* ./data/* >> $TEMPLATE
echo 'COMMIT;' >> $TEMPLATE

chmod 777 $BASELINE
echo '' > $BASELINE
chmod 644 $BASELINE
java -jar ./scripts/tokenizer.jar $TEMPLATE $BASELINE ./conf/project_descriptor.xml > ./logs/building.log
chmod 444 $BASELINE

rm $TEMPLATE