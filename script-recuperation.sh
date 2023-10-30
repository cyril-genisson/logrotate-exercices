#!/bin/bash
#
# Author: Cyril GENISSON
# Created: 30/10/2023
# Updated: 30/10/2023
#
# Nom du script: script-recuperation.sh
# Description: récupération du nombre de connexions journalier en fonction de deux date
# example: ./script-recuperation.sh 08-SEP-2023 20-SEP-2023
# sauvegarde: /var/backup/recuperation-30-OCT-2023.tar.gz

SAVE=recuperation-$(date +"%d-%b-%Y").tar.gz

