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



# Utilise l'image officielle de WordPress
FROM wordpress:latest

# Ajoutez des plugins ou des personnalisations ici si nécessaire
# COPY mon_plugin /var/www/html/wp-content/plugins/

# Expose le port 9000 pour PHP-FPM
EXPOSE 9000
