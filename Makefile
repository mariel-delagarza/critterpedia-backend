migrate:
	docker-compose run --rm node-backend yarn prisma migrate dev

reset:
	docker-compose run --rm node-backend yarn prisma migrate reset --force

##if on prune or rebuild a module is not found
##after running install, docker-compose up should
##start as normal
install:
	docker-compose run --rm node-backnd yarn install
