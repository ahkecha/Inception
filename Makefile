mandatory:
	docker-compose up

rebuild:
	docker-compose build
	docker-compose up

down:
	docker-compose down

clean:
	docker rm $$(docker ps -a | awk 'NR > 1{print $$1}' | tr '\n' ' ')

fclean:
	docker image prune -a -f

superclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker network rm $$(docker network ls -q) 2>/dev/null"
	rm -rf ./data/wordpress/*
	rm -rf ./data/hugo/*
	rm -rf ./data/nginx/*
