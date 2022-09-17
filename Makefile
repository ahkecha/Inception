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
