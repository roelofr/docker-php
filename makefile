###
#
# Makefile for Docker files
#
# Just run make
#
###

# Define 'fake' files
.PHONY: default build push

### Create dockerfiles ###
default: php/dockerfile php-fpm/dockerfile php-apache/dockerfile

php/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php php:cli

php-fpm/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-fpm php:fpm

php-apache/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-apache php:apache

### Build Docker containers ###
build: build/php build/php-fpm build/php-apache

build/php: php/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:latest \
		--tag=roelofr/php:cli \
		php/

build/php-fpm: php-fpm/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:fpm \
		php-fpm/

build/php-apache: php-apache/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:apache \
		php-apache/

### Publish Docker containers
push:
	docker push \
		--disable-content-trust=false \
		roelofr/php
