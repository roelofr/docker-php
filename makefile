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
default: php/latest/dockerfile fpm/latest/dockerfile apache/latest/dockerfile

php/latest/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile cli/latest php:cli

fpm/latest/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile fpm/latest php:fpm

apache/latest/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile apache/latest php:apache

### Build Docker containers ###
build: build/php build/fpm build/apache

build/php: php/latest/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:latest \
		--tag=roelofr/php:cli \
		php/latest/

build/fpm: php-fpm/latest/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:fpm \
		fpm/latest/

build/apache: apache/latest/dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:apache \
		apache/latest/

### Publish Docker containers
push:
	docker push \
		--disable-content-trust=false \
		roelofr/php
