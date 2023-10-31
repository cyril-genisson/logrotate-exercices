#!/bin/bash
#
# Author: Cyril GENISSON
# Created: 30/10/2023
# Updated: 30/10/2023
#
# Nom du script: script-recuperation.sh
# Description: récupération du nombre de connexions journalier en fonction de deux dates jj-mm-yyyy   
# example: ./script-recuperation.sh 08-SEP-2023 20-SEP-2023
# sauvegarde: /var/backup/recuperation-30-OCT-2023.tar.gz

SAVE=/var/backup/recuperation-$(date +"%d-%b-%Y").tar.gz
AFTER=$1
BEFORE=$2
TEMP=/tmp/connexions

if [ -d /tmp/connexions ]; then 
    rm -fR $TEMP
    mkdir $TEMP
else
    mkdir $TEMP
fi

function inverse {
    day=$(echo $1 | cut -f1 -d '-')
    month=$(echo $1 | cut -f2 -d '-')
    year=$(echo $1 | cut -f3 -d '-')
    echo "$year-$month-$day"
}

k=$(inverse $AFTER)
while [ $k != $(inverse $BEFORE) ] ; do
    journalctl --since $k --until $(date -d "$k + 1 days" +"%Y-%m-%d") | grep "New session" > $TEMP/connexions-$k
    k=$(date -d "$k + 1 days" +"%Y-%m-%d")
done

tar -czvf $SAVE $TEMP/connexions-*
rm -f $TEMP/connexions-*
