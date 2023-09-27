WPCLI=$(shell docker ps -a -q --filter "name=wpcli")

start:
	docker-compose up -d --build

down:
	docker-compose down

wordpress-autoinstall: start

drupal-autoinstall:
	@echo 'drupal'

autoinstall:
ifeq ($(cms),wordpress)
autoinstall: wordpress-autoinstall
else
	@echo "Please select a valid cms (drupal or wordpress)!"
endif

cleanup:
	@echo "Cleaning up..."
	docker rm $(WPCLI)