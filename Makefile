NAME = inception
DIRS = bd_data wp_data
BASE_PATH = /home/jamendoe/data
DIR_PATHS = $(addprefix $(BASE_PATH)/, $(DIRS))
DOCKER_COMPOSE = docker compose -f srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	mkdir -p $(DIR_PATHS)
	$(DOCKER_COMPOSE) up --build -d

stop:
	$(DOCKER_COMPOSE) stop

restart: stop
	$(DOCKER_COMPOSE) up -d

clean:
	$(DOCKER_COMPOSE) down -v
	@rm -rf $(DIR_PATHS)

fclean: clean
	$(DOCKER_COMPOSE) down --rmi all --volumes
	@docker system prune -af
re: fclean all

.PHONY: all stop restart clean fclean re
