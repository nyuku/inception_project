#!/bin/bash

SETUP_FILE="/var/www/wordpress/.setup"
WORDPRESS_PATH="/var/www/wordpress"
LOG_DIR="/var/log/wp-setup"
LOG_FILE="$LOG_DIR/setup.log"
ENV_LOG="$LOG_DIR/env.log"

# Création du répertoire de logs
mkdir -p $LOG_DIR
echo "Démarrage du script de configuration" > $LOG_FILE
echo "Variables d'environnement : " > $ENV_LOG

# Vérifie si le fichier .setup existe
if test -f "$SETUP_FILE"; then
    echo "WordPress est déjà configuré !" | tee -a $LOG_FILE
else
    echo "Initialisation de WordPress..." | tee -a $LOG_FILE

    # Enregistrer les variables d'environnement
    echo "MARIADB_DATABASE=$MARIADB_DATABASE" >> $ENV_LOG
    echo "MARIADB_USER=$MARIADB_USER" >> $ENV_LOG
    echo "MARIADB_PASSWORD=$MARIADB_PASSWORD" >> $ENV_LOG
    echo "WORDPRESS_URL=$WORDPRESS_URL" >> $ENV_LOG
    echo "WORDPRESS_TITLE=$WORDPRESS_TITLE" >> $ENV_LOG
    echo "WORDPRESS_ADMIN_NAME=$WORDPRESS_ADMIN_NAME" >> $ENV_LOG
    echo "WORDPRESS_ADMIN_PASSWORD=$WORDPRESS_ADMIN_PASSWORD" >> $ENV_LOG
    echo "WORDPRESS_ADMIN_EMAIL=$WORDPRESS_ADMIN_EMAIL" >> $ENV_LOG
    echo "WORDPRESS_USER_NAME=$WORDPRESS_USER_NAME" >> $ENV_LOG
    echo "WORDPRESS_USER_EMAIL=$WORDPRESS_USER_EMAIL" >> $ENV_LOG
    echo "WORDPRESS_USER_PASSWORD=$WORDPRESS_USER_PASSWORD" >> $ENV_LOG

    # Création du répertoire WordPress
    mkdir -p $WORDPRESS_PATH
    cd $WORDPRESS_PATH || exit 1

    # Téléchargement de WP-CLI
    echo "Téléchargement de WP-CLI..." | tee -a $LOG_FILE
    wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    if [ $? -ne 0 ]; then
        echo "Erreur : Échec du téléchargement de WP-CLI." | tee -a $LOG_FILE
        exit 1
    fi

    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Téléchargement de WordPress
    echo "Téléchargement de WordPress..." | tee -a $LOG_FILE
    wp core download --allow-root >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur : Échec du téléchargement de WordPress." | tee -a $LOG_FILE
        exit 1
    fi

    # Attente de la base de données
    echo "Attente de la base de données..." | tee -a $LOG_FILE
    sleep 10

    # Création de wp-config.php
    echo "Création du fichier wp-config.php..." | tee -a $LOG_FILE
    wp config create \
        --dbname="$MARIADB_DATABASE" \
        --dbuser="$MARIADB_USER" \
        --dbpass="$MARIADB_PASSWORD" \
        --dbhost="mariadb" \
        --allow-root >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur : Échec de la création du fichier wp-config.php." | tee -a $LOG_FILE
        exit 1
    fi

    # Installation de WordPress
    echo "Installation de WordPress..." | tee -a $LOG_FILE
    wp core install \
        --url="$WORDPRESS_URL" \
        --title="$WORDPRESS_TITLE" \
        --admin_name="$WORDPRESS_ADMIN_NAME" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL" \
        --allow-root >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur : Échec de l'installation de WordPress." | tee -a $LOG_FILE
        exit 1
    fi

    # Création d'un utilisateur supplémentaire
    echo "Création de l'utilisateur WordPress..." | tee -a $LOG_FILE
    wp user create "$WORDPRESS_USER_NAME" \
        "$WORDPRESS_USER_EMAIL" \
        --role=author \
        --user_pass="$WORDPRESS_USER_PASSWORD" \
        --allow-root >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "Erreur : Échec de la création de l'utilisateur." | tee -a $LOG_FILE
        exit 1
    fi

    # Création des répertoires nécessaires
    echo "Configuration finale..." | tee -a $LOG_FILE
    mkdir -p /run/php/
    touch $SETUP_FILE
    echo "Configuration terminée avec succès." | tee -a $LOG_FILE
fi

# Lancement de PHP-FPM
echo "Lancement de WordPress avec PHP-FPM..." | tee -a $LOG_FILE
/usr/sbin/php-fpm7.3 -F



# # !/bin/bash

# SETUP_FILE="/var/www/wordpress/.setup"

# # Vérifie si le fichier .setup existe
# if test -f "$SETUP_FILE"; then

#     echo "Already setup!"

# else
# 	echo "no setup!"
#     mkdir -p /var/www/wordpress
#     cd /var/www/wordpress

#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#     chmod 777 wp-cli.phar
#     mv wp-cli.phar /usr/local/bin/wp

#     wp core download --allow-root

#     sleep 10
# 	echo "$MARIADB_DATABASE="$MARIADB_DATABASE > env_check
#     wp config create \
#         --dbname=$MARIADB_DATABASE \
#         --dbuser=$MARIADB_USER \
#         --dbpass=$MARIADB_PASSWORD \
#         --dbhost=mariadb \
#         --allow-root

#     wp core install \
#         --url=$WORDPRESS_URL \
#         --title=$WORDPRESS_TITLE \
#         --admin_name=$WORDPRESS_ADMIN_NAME \
#         --admin_password=$WORDPRESS_ADMIN_PASSWORD \
#         --admin_email=$WORDPRESS_ADMIN_EMAIL \
#         --allow-root

#     wp user create $WORDPRESS_USER_NAME\
#         $WORDPRESS_USER_EMAIL \
#         --role=author \
#         --user_pass=$WORDPRESS_USER_PASSWORD \
#         --allow-root

#     mkdir -p /run/php/
#     touch $SETUP_FILE
# fi
 
# echo "Launchin wordpress with php-fpm"
# /usr/sbin/php-fpm7.3 -F