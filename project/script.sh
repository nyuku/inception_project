#!/bin/bash

# Définir les permissions par défaut
DIR_PERMISSIONS="775"
FILE_PERMISSIONS="664"

# Créer la structure principale
mkdir -p project/{secrets,srcs/{requirements/{mariadb,nginx,bonus,tools,wordpress},.}}

# Créer les fichiers principaux
touch project/Makefile
touch project/secrets/{credentials.txt,db_password.txt,db_root_password.txt}
touch project/srcs/{docker-compose.yml,.env}
touch project/srcs/requirements/{mariadb/Dockerfile,mariadb/.dockerignore}
touch project/srcs/requirements/{nginx/Dockerfile,nginx/.dockerignore}

# Ajouter les sous-dossiers
mkdir -p project/srcs/requirements/{mariadb/conf,mariadb/tools}
mkdir -p project/srcs/requirements/{nginx/conf,nginx/tools}

# Ajouter du contenu par défaut dans les fichiers
echo "DOMAIN_NAME=wil.42.fr" > project/srcs/.env
echo "# MYSQL SETUP" >> project/srcs/.env
echo "MYSQL_USER=XXXXXXXXXXXX" >> project/srcs/.env
echo "# Place your Makefile content here" > project/Makefile

# Ajouter un contenu par défaut dans Dockerfiles
echo "# Base Dockerfile for MariaDB" > project/srcs/requirements/mariadb/Dockerfile
echo "# Base Dockerfile for Nginx" > project/srcs/requirements/nginx/Dockerfile

# Ajuster les permissions
chmod -R $DIR_PERMISSIONS project
find project -type f -exec chmod $FILE_PERMISSIONS {} \;

# Affichage final
echo "Structure de projet créée avec succès."
tree -a project  # Nécessite l'outil 'tree' pour afficher la structure (peut être installé via `sudo apt install tree`)

