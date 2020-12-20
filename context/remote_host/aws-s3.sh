#!/bin/bash


DATE=$(date +%H-%M-%S)
BACKUP=testdb-$DATE


DB_USER=$1
DB_PASS=$2
DB_HOST=$3
DB_NAME=$4
AWS_SECRET=$5
BUCKET_NAME=$6

mysqldump -u $DB_USER -h $DB_HOST -p$DB_PASS $DB_NAME > /tmp/$BACKUP.sql

export AWS_ACCESS_KEY_ID=AKIAYKSRGSLZZWOADAPZ && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
echo "Uploading $BACKUP backup"

aws s3 cp /tmp/$BACKUP.sql s3://$BUCKET_NAME/$BACKUP

