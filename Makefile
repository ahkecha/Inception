all:
	docker-compose up --build

re: clean all

down:
	docker-compose down

clean:
	docker rm $$(docker ps -qa)

fclean: clean
	docker image prune -a -f

superclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	rm -rf ./data/wordpress/*
	rm -rf ./data/hugo/*
	rm -rf ./data/nginx/*
	rm -rf /tmp/mariadb
