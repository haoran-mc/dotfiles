#!/bin/sh

echo "======== start clean docker containers logs ========"

logfiles=$(find /var/lib/docker/containers/ -name *-json.log)

for logfile in $logfiles
do
    echo "clean log: $logfile"
    cat /dev/null > $logfile
done
vim

echo "======== end clean docker containers logs ========"
