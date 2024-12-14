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

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www 
# Décompresser et supprimer .tar  
# WORKDIR /var/www 
# RUN tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz && rm /var/www/wordpress-6.0-fr_FR.tar.gz

# deplace le fichier que l'on doit configurer
# COPY conf/wp-config.php /var/www/wordpress/wp-config.php

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/init.sh /var/www/

#≻────────────── ⋆✩⋆ AUTORISATION ⋆✩⋆──────────────≺

#≻────────────── ⋆✩⋆ PORT ⋆✩⋆──────────────≺

EXPOSE 9000
#≻────────────── ⋆✩⋆ Config ⋆✩⋆──────────────≺

#≻────────────── ⋆✩⋆ Lancement ⋆✩⋆──────────────≺
WORKDIR /var/www/wordpress

CMD ["bash", "/var/www/init.sh"]

