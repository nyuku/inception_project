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

	FROM debian:stable-slim
	# ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

	RUN apt update -y 
	RUN apt install nginx vim curl openssl -y
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










	# # ≻────────────── ⋆✩⋆ ENV SYSTEME ⋆✩⋆──────────────≺
	# # debian: buster est trop lourd et complet,
	# FROM debian:stable-slim
	# # ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

	# # CMD ["echo", "Hello from Debian!"] peux pas afficher le terminal en meme temps

	# # curl: envoyer des requêtes réseau HTTP.
	# # apt-get vs apt?
	# # RUN apt update -y
	# # RUN apt install nginx -y
	# # RUN apt install vim -y    
	# # RUN apt install curl -y   
	# # RUN apt-get install openssl -y
	# # procps pour controler que nginx est bine installé avec ps aux | grep nginx

	# # en 1 commande pour reduire la taille
	# RUN apt-get update -y 
	# Run apt-get install nginx vim curl openssl procps -y
	# # ≻────────────── ⋆✩⋆ PROTOCOLE ⋆✩⋆──────────────≺

	# # cree dossier pour le protocole, installe l'outil, -p secu pour pas doublon
	# # /etc : Un répertoire standard pour les fichiers de configuration sous Linux
	# # e chemin /etc/nginx/ssl sera créé à l'intérieur du conteneur, pas sur la machine hôte.
	# RUN mkdir -p /etc/nginx/ssl
	
	# # req crée et traite principalement des demandes de certificats au format PKCS#10 standard
	# # x509 est le type de certificat, Les certificats auto-signés  basiques. privé:tourne sans internet pas besoin de plus
	# # -nodes= -y dans openssl pour contourner le mdp
	# # out certificat
	# # keyout: cle
	# # -subj pour mute les demandes sur le certificats
	# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aschaefe.42.fr/UID=login"
	# # ≻────────────── ⋆✩⋆ CONFIG ⋆✩⋆──────────────≺

	# # stocker les fichiers de config de NGINX
	# RUN mkdir -p /var/run/nginx
	# # Le fichier de configuration de NGINX devrait être remplacé par le notre au démarrage du container
	# COPY conf/nginx.conf /etc/nginx/nginx.conf
	# #≻────────────── ⋆✩⋆ AUTORISATION - PORT ⋆✩⋆──────────────≺

	# # (notre root principal)
	# RUN chmod 755 /var/www/html 
	# # (l’utilisateur principal)
   	# RUN chown -R www-data:www-data /var/www/html 

	# RUN chmod 644 /etc/nginx/nginx.conf
	# RUN chmod 755 /etc/nginx

	# #the only port allowed
	# EXPOSE	443
	# #≻────────────── ⋆✩⋆ PAGE PAR DEFAULT ⋆✩⋆──────────────≺

	# RUN echo "<h1>BOUH /ᐠ - ˕ -マ /ᐠ. ｡.ᐟ\ᵐᵉᵒʷˎˊ˗  ₍^.  ̫.^₎! </h1>" > /var/www/html/index.html
	# #≻────────────── ⋆✩⋆ COMMANDE DE LANCEMENT ⋆✩⋆──────────────≺
	# # in foreground, entry
	# CMD ["nginx", "-g", "daemon off;"]


	# (\ (\
	# ( • •) i'm watching
#    ━∪∪━━━━