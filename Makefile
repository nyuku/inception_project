# ╔──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╗
# |		MAKEFILE
# 	
# ╚──────────────────────────────────────────────¤◎¤──────────────────────────────────────────────╝

# ---------------- Color --------------
GREEN			=	\033[1;32m
CYAN			=	\033[1;36m
YELLOW 			=	\033[38;5;215m
BG_GREEN		=	\033[42m
LILAC			= 	\033[0;94m
ENDCOLOR		=	\033[0m

# ---------------- Message--------------
START_TXT       =   echo "$(GREEN)Launching just started$(ENDCOLOR)"
DOWN_TXT        =   echo "$(LILAC)Shutting down services$(ENDCOLOR)"
STOP_TXT        =   echo "$(YELLOW)Stopping services$(ENDCOLOR)"
BUILD_TXT     =   echo "$(GREEN)Building$(ENDCOLOR)"
STATUS_TXT      =   echo "$(CYAN)Checking container status$(ENDCOLOR)"
CLEAN_TXT     	=   echo "$(CYAN)Cleaning$(ENDCOLOR)"
# --------------- VISUEL --------------------

all : build up

up :
	@docker compose -f ./srcs/docker-compose.yml up -d
	@$(START_TXT)

down :
	@docker compose -f ./srcs/docker-compose.yml down
	@$(DOWN_TXT)

stop :
	@docker compose -f ./srcs/docker-compose.yml stop
	@$(STOP_TXT)

build:
	@docker compose -f ./srcs/docker-compose.yml build
	@$(BUILD_TXT)

status :
	@docker ps
	@$(STATUS_TXT)
re :	down up

clean: down
	docker system prune -a
	@$(CLEAN_TXT)
wp:
	rm -rf /tmp/data/wordpress/*
maria:
	rm -rf /tmp/data/mariadb/*
.PHONY: re all clean stop up down build status
