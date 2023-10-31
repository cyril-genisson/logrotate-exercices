# logrotate-exercices
Logrotate

# Job 1
Script de backup de tous les fichiers du répertoire $HOME
de chaque utilisateur du système offrant différentes possibilités:
- fichiers crées depuis moins de 7 jours
- fichiers modifiés depuis plus de 7 jours
- répertoires dont le contenu est > 10Mo
- Répertoires et fichiers cachés

Dossier de sauvegarde: */var/backup/*
nom du fichier: $USER-$OPTION-DATE.tar.gz

# Job 2
Script de récupération des données de connexion en fonction d'un écart de date.
exemple d'utilisatation:
./script-recuperation.sh 10-03-2023 12-03-2023
-> rendu /var/backup/recuperation-10-SEP-2023.tar.gz

# Job 3
Utilisation de tshark pour capturer les trames réseaux durant
1 minutes et sauvegarde dans le fichier */var/log/tshark.log

Automatisation du script pour qu'il se lance toutes les 5 minutes

Rotation des logs: dès que le fichier fait plus de 1Mo on conserve les
données dans d'autres fichiers /var/log/tshark.log.{1..4}.gz
*Utilisation de logrotate*

# Pour aller plus loin
Deamoniser le job3 de manière à ce que la rotation de logs
tourne en background dès le démarrage du système.

Pour ce dernier job il suffit de créer un descripteur de service
dans /etc/systemd/system qui démarrera juste après le réseau du système

```text
[Unit]
Description=Service de surveillance réseau
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /usr/local/bin/script-tshark.sh

[Install]
WantedBy=multi-user.target
```

Ensuite il nous suffit de définir les permissions du fichier
à 644 et d'activer le service à l'aide de systemctl:
```bash
chmod 644 /etc/systemd/system/tshark.service
systemctl enable tshark.service --now
```
