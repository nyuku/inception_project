# ╔──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╗
# |		CommandeS 
# 		✩ Docker build: docker build -t mariadb_image srcs/requirements/mariadb/ 
#       ✩ Pour lancer le docker solo :docker run <image_name>
#       ✩ Verifier les images: docker images
#       ✩ Docker en cours: docker ps ( -a)
# ╚──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╝

# ≻────────────── ⋆✩⋆ ENV SYSTEME ⋆✩⋆──────────────≺

FROM debian:buster
# ≻────────────── ⋆✩⋆ INSTALLATION ⋆✩⋆──────────────≺

RUN apt-get update -y 
RUN apt-get install procps mariadb-server -y
# ≻────────────── ⋆✩⋆ CONFIG ⋆✩⋆──────────────≺

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh /

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

RUN chmod +x /script.sh
CMD ["bash", "script.sh"]