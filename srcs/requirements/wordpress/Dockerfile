# ╔──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╗
# |		CommandeS 
# 		✩ Docker build -t wordpress_image .  
#       ✩ Pour lancer le docker solo :docker run -it wordpress_image 
#       ✩ Docker run -it --rm -p 443:443 wordpress_image nginx -g "daemon off;"
#       ✩ rentrer de force :docker exec -it <nom_du_conteneur_nginx> /bin/sh
# 
# 		Consignes:
#		✩ php-fpm (installé et configuré) uni- quement sans nginx.
# ╚──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╝

# ≻────────────── ⋆✩⋆ ENV SYSTEME ⋆✩⋆──────────────≺
FROM debian:buster
RUN apt-get update && apt-get upgrade -y
# ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

#outils pour télécharger des fichiers externes, version spécifique
RUN apt-get install -y wget php7.3 php7.3-fpm php-mysql mariadb-client && \
    mkdir -p /run/php

# PHP
# RUN apt-get install -y php7.3\
# php-fpm\
# php-mysql\
# mariadb-client

# Wordpress v 6.0
# WORKDIR /tmp
# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /tmp


RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www 
# Décompresser et supprimer .tar  
WORKDIR /var/www 
RUN tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz && rm /var/www/wordpress-6.0-fr_FR.tar.gz

# deplace le fichier que l'on doit configurer
RUN cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

# j'arrive pas a deplacer le dossier qui a deja dans www?????
# RUN cp -a /tmp/wordpress/. /var/www/wordpress
#≻────────────── ⋆✩⋆ AUTORISATION ⋆✩⋆──────────────≺

# RUN		chown -R www-data:www-data  /var/www/wordpress
#≻────────────── ⋆✩⋆ PORT ⋆✩⋆──────────────≺

EXPOSE 9000
#≻────────────── ⋆✩⋆ Config ⋆✩⋆──────────────≺

# COPY ./conf/script.sh /
#≻────────────── ⋆✩⋆ Lancement ⋆✩⋆──────────────≺
CMD ["php-fpm7.3", "-F"]




# # Utilise l'image officielle de WordPress
# FROM wordpress:latest

# # Ajoutez des plugins ou des personnalisations ici si nécessaire
# # COPY mon_plugin /var/www/html/wp-content/plugins/

# # Expose le port 9000 pour PHP-FPM
# EXPOSE 9000
