# !/bin/bash

SETUP_FILE="/var/www/wordpress/.setup"

# Vérifie si le fichier .setup existe
if test -f "$SETUP_FILE"; then

    echo "Already setup!"

else

    mkdir -p /var/www/wordpress
    cd /var/www/wordpress

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root

    sleep 10

    wp core config \
        --dbname=$MARIADB_DATABASE \
        --dbuser=$MARIADB_USER \
        --dbpass=$MARIADB_PASSWORD \
        --dbhost=mariadb \
        --allow-root

    wp core install \
        --url=$WORDPRESS_URL \
        --title=$WORDPRESS_TITLE \
        --admin_name=$WORDPRESS_ADMIN_NAME \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL \
        --allow-root

    wp user create $WORDPRESS_USER_NAME\
        $WORDPRESS_USER_EMAIL \
        --role=author \
        --user_pass=$WORDPRESS_USER_PASSWORD \
        --allow-root

    mkdir -p /run/php/
    touch /tmp/.setup
fi
 
echo "Launchin wordpress with php-fpm"
/usr/sbin/php-fpm7.3 -F