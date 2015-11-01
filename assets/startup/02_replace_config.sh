#!/bin/bash
RD_CONFIG=/etc/rundeck/rundeck-config.properties

SERVER_URL=${SERVER_URL:-"http://localhost:4440"}
DATABASE_URL=${DATABASE_URL:-"jdbc:postgresql://db/rundeck"}
DATABASE_USER=${DATABASE_USER:-"rundeck"}
DATABASE_PASS=${DATABASE_PASS:-"rundeck"}

echo "changing ${RD_CONFIG}"

echo "set grails.serverURL to ${SERVER_URL}"
sed -i "s,grails.serverURL.*,grails.serverURL=${SERVER_URL},g" $RD_CONFIG

echo "set dataSource.url to ${DATABASE_URL}"
sed -i "s,dataSource.url.*,dataSource.url=${DATABASE_URL},g" $RD_CONFIG

echo "using user ${DATABASE_USER} to connect to database"
echo "dataSource.username=${DATABASE_USER}" >> $RD_CONFIG
echo "dataSource.password=${DATABASE_PASS}" >> $RD_CONFIG
