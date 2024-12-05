	# commande pour lancer le docker solo :docker run -it nginx 

	# debian: buster est trop lourd et complet,
	FROM debian:stable-slim

	# CMD ["echo", "Hello from Debian!"] peux pas afficher le terminal en meme temps

	# util en ligne de commande curl: envoyer des requêtes réseau HTTP.
	# RUN apt update -y
	# RUN apt install nginx -y
	# RUN apt install vim -y    
	# RUN apt install curl -y   

	# en 1 commande pour reduire la taille
	# procps pour controler que nginx est bine installé avec ps aux | grep nginx

	RUN apt-get update -y 
	Run apt-get install nginx vim curl openssl procps -y

	# RUN apt-get update -y
	# RUN apt-get install -y nginx
	# RUN apt-get install -y vim
	# RUN apt-get install -y curl
	# cree dossier pour le protocole, installe l'outil, -p secu pour pas doublon
	# /etc : Un répertoire standard pour les fichiers de configuration sous Linux
	# e chemin /etc/nginx/ssl sera créé à l'intérieur du conteneur, pas sur votre machine hôte.
	RUN mkdir -p /etc/nginx/ssl
	# RUN apt-get install openssl -y

	# req crée et traite principalement des demandes de certificats au format PKCS#10 standard
	# x509 est le type de certificat, Les certificats auto-signés  basiques. privé:tourne sans internet pas besoin de plus
	# -nodes= -y dans openssl pour contourner le mdp
	# out certificat
	# keyout: cle
	# -subj pour mute les demandes sur le certificats
	RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aschaefe.42.fr/UID=login"
	
	# stocker les fichiers de config de NGINX
	RUN mkdir -p /var/run/nginx
	# Le fichier de configuration de NGINX devrait être remplacé par le notre au démarrage du container
	COPY conf/nginx.conf /etc/nginx/nginx.conf
#-------------
	# # (notre root principal)
	RUN chmod 755 /var/www/html 
	# # (l’utilisateur principal)
   	RUN chown -R www-data:www-data /var/www/html 
	#the only port allowed
	EXPOSE	443

	RUN chmod 644 /etc/nginx/nginx.conf
	RUN chmod 755 /etc/nginx

	# Commande d'entrée
	RUN echo "<h1>BOUH 👻 ! </h1>" > /var/www/html/index.html

	CMD ["nginx", "-g", "daemon off;"]

