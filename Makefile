mandatory:
	docker-compose up

rebuild:
	docker-compose build
	docker-compose up

down:
	docker-compose down

fclean:
	docker image prune -a -f
