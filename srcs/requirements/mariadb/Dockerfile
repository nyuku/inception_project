# ╔──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╗
# |		CommandeS 
# 		✩ Docker build: docker build -t mariadb_image srcs/requirements/mariadb/ 
#       ✩ Pour lancer le docker solo :docker run <image_name>
#       ✩ Verifier les images: docker images
#       ✩ Docker en cours: docker ps ( -a)
# ╚──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╝

# ≻────────────── ⋆✩⋆ ENV SYSTEME ⋆✩⋆──────────────≺

# debian: buster est trop lourd et complet,
FROM debian:buster
# ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

# 10.3 version de Maria
RUN apt-get update -y 
RUN apt-get install mariadb-server -y
# ≻────────────── ⋆✩⋆ CONFIG ⋆✩⋆──────────────≺

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf








# # Utilise l'image officielle de MySQL
# FROM mysql:latest

# # Spécifiez la configuration de la base de données si nécessaire
# # COPY mon_fichier_de_configuration.cnf /etc/mysql/conf.d/

# # Expose le port 3306 pour la base de données
# EXPOSE 3306