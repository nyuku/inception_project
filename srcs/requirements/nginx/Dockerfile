# ╔──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╗
# |		CommandeS 
# 		✩ Docker build -t nginx_image .  
#       ✩ Pour lancer le docker solo : docker run -it nginx 
#       ✩ Docker run -it --rm -p 443:443 nginx_image nginx -g "daemon off;"
#       ✩ rentrer de force :docker exec -it <nom_du_conteneur_nginx> /bin/sh
# 
# 		Consignes:
#		✩ TLSv1.2 ou TLSv1.3 uniquement
#		✩ Port 443 = HTTPS
#		✩ "docker compose exec nginx bash" lance le container
# ╚──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╝

	# ≻────────────── ⋆✩⋆ ENV SYSTEME ⋆✩⋆──────────────≺

	FROM debian:buster
	# ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

	RUN apt update -y 
	RUN apt install nginx curl openssl -y
	# ≻────────────── ⋆✩⋆ PROTOCOLE ⋆✩⋆──────────────≺

	RUN mkdir -p /etc/nginx/ssl
	RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=angnguye.42.fr/UID=login"
	# ≻────────────── ⋆✩⋆ CONFIG ⋆✩⋆──────────────≺

	RUN mkdir -p /var/run/nginx
	COPY conf/nginx.conf /etc/nginx/nginx.conf
	
	# COPY conf/index.html /var/www/html
	#≻────────────── ⋆✩⋆ AUTORISATION - PORT ⋆✩⋆──────────────≺

	RUN chmod 755 /var/www/html 
   	RUN chown -R www-data:www-data /var/www/html 

	RUN chmod 644 /etc/nginx/nginx.conf
	RUN chmod 755 /etc/nginx

	EXPOSE	443
	#≻────────────── ⋆✩⋆ PAGE PAR DEFAULT index ⋆✩⋆──────────────≺

	RUN echo "<h1> BOUH ! </h1>" > /var/www/html/index.html
