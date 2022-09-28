all:
	docker-compose -f srcs/docker-compose.yaml up --build

re: clean all

down:
	docker-compose -f srcs/docker-compose.yaml down -f srcs/docker-compose.yaml

clean:
	docker rm $$(docker ps -qa)

fclean: clean
	docker image prune -a -f

superclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
	rm -rf ./srcs/data/wordpress/*
	rm -rf ./srcs/data/hugo/*
	rm -rf ./srcs/data/nginx/*
	rm -rf /tmp/mariadb/*
	rm -rf /tmp/wordpress/*

