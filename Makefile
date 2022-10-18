all-build:
	@mkdir -m 777 -p /home/ahkecha/data/mariadb
	@mkdir -m 777 -p /home/ahkecha/data/wordpress
	docker-compose -f srcs/docker-compose.yaml up --build
all:
	docker-compose -f srcs/docker-compose.yaml up

up:
	docker-compose -f srcs/docker-compose.yaml up

build:
	docker-compose -f srcs/docker-compose.yaml build

down:
	docker-compose -f srcs/docker-compose.yaml down

clean:
	# docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)

fclean: clean
	docker image prune -a -f

superclean:
	# docker stop $$(docker ps -qa)
	# docker rm $$(docker ps -qa)
	docker image prune -a -f
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q)

