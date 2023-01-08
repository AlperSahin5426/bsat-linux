#!/bin/bash

DIRECTORY="/home/alper/bsm"
CHANGED_FILES=$(find $DIRECTORY -mtime -1)

psql -U alper -d benimdb -c"
for FILE in $CHANGED_FILES; do
psql -c "INSERT INTO changes (date,filename) VALUES (CURRENT_TIMESTAMP,'$FILE');"
done
