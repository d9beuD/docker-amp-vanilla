build:
	docker compose --progress=plain build

up:
	docker compose up -d

logs:
	docker compose logs -f

stop:
	docker compose stop

restart: stop up

exec:
	docker compose exec apache /bin/bash

# Command to init the project
init: build up

# Command to remove Docker containers and volumes
rm-containers:
	docker compose down -v

# Command to prune unused Docker data
prune:
	docker system prune -f --volumes
