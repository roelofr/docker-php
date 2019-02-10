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
	./build-dockerfile cli/7.1 php:7.1-cli
	./build-dockerfile cli/7.2 php:7.2-cli
	./build-dockerfile cli/7.3 php:7.3-cli
	./build-dockerfile cli/latest php:cli

fpm/latest/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile fpm/7.1 php:7.1-fpm
	./build-dockerfile fpm/7.2 php:7.2-fpm
	./build-dockerfile fpm/7.3 php:7.3-fpm
	./build-dockerfile fpm/latest php:fpm

apache/latest/dockerfile: dockerfile install-composer.sh build-dockerfile
	./build-dockerfile apache/7.1 php:7.1-apache
	./build-dockerfile apache/7.2 php:7.2-apache
	./build-dockerfile apache/7.3 php:7.3-apache
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
