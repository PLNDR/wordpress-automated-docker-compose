WPCLI=$(shell docker ps -a -q --filter "name=wpcli")
HEALTHCHECK=$(shell docker ps -a -q --filter "name=healthcheck")

start:
	docker-compose up -d --build

healthcheck:
	docker-compose run --rm healthcheck

down:
	docker-compose down

install: start healthcheck

configure:
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

wordpress-autoinstall: start
	docker-compose -f docker-compose.yml -f wp-auto-config.yml run --rm wp-auto-config

drupal-autoinstall:
	@echo 'drupal'

remove: down
	@echo "💥 Removing related folders/files..."
	@rm -rf  mysql/* wordpress/* database/*

autoinstall:
ifeq ($(cms),drupal)
autoinstall: drupal-autoinstall
else ifeq ($(cms),wordpress)
autoinstall: wordpress-autoinstall
else
	@echo "Please select a valid cms (drupal or wordpress)!"
endif

cleanup:
	@echo "Cleaning up..."
	docker rm $(WPCLI)
	docker rm $(HEALTHCHECK)