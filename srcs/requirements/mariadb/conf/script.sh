#!/bin/bash


# Chemin du fichier .setup
SETUP_FILE="/var/lib/mysql/.setup"

mkdir -p /var/run/mysqld

# Vérifie si le fichier .setup existe
if test -f "$SETUP_FILE"; then

    echo "Already setup!"

else

    echo "Starting MariaDB service..."

    # Lancer le service MySQL
    service mysql start

    echo "Le fichier .setup n'existe pas. Initialisation en cours..."

    # Attendre que MariaDB soit prêt
    until mysqladmin ping --silent; do
        echo "Attente de MariaDB..."
        sleep 2
    done

    # Configurer le mot de passe root
    echo 'Change root password'
    mysqladmin -u root password "${MARIADB_ROOT_PASSWORD}"
    echo 'Root password successfully changed!'

    # Créer une base de données si elle n'existe pas
    echo "Create DB"
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"

    echo "Create USER and GRANT PRIVILEGES to DB"
    # Créer un utilisateur MariaDB si non existant et lui attribuer des privilèges
    mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%';"

    touch /tmp/.setup

    service mysql stop
fi

echo "Launching mysql daemon"
mysqld_safe --datadir=/var/lib/mysql