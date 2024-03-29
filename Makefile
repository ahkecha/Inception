all:
	@mkdir -m 777 -p /home/ahkecha/data/mariadb
	@mkdir -m 777 -p /home/ahkecha/data/wordpress
	docker-compose -f srcs/docker-compose.yaml up --build

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
	# docker volume rm $$(docker volume ls -q)
	# docker network rm $$(docker network ls -q)
	# docker image prune -a -f

