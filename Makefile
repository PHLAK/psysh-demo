build:
	@docker-compose build --force-rm --pull

demo run:
	@docker-compose run --rm demo; docker-compose down
