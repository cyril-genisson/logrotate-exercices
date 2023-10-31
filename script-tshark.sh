#!/bin/bash
#
# Author: Cyril GENISSON
# Created: 30/10/2023
# Updated: 30/10/2023
#
# Nom du script: script-tshark.sh
# Description: capture tous les packets du réseau durant une minute
# et les logs dans le fichier /var/log/tshark.log 
#

tshark -x -a duration:60 >> /var/log/tshark.log

