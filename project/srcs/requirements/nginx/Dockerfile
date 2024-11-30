# commande pour lancer le docker solo docker run -it nginx 

# Base Dockerfile for Nginx
# debian: buster est trop lourd et complet
FROM debian:stable-slim

# CMD ["echo", "Hello from Debian!"] peux pas afficher le terminal en meme temps


RUN apt update -y
RUN apt install nginx -y
RUN apt install vim -y    
RUN apt install curl -y   

# cree dossier pour le protocole, installe l'outil
RUN mkdir -p /etc/nginx/ssl
RUN apt install OpenSSL -y
# req crée et traite principalement des demandes de certificats au format PKCS#10 standard
# x509 est le type de certificat
# -nodes= -y dans openssl pour contourner le mdp
# out et keyout?
# -subj pour mute les demandes sur le certificats
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aschaefe.42.fr/UID=login"