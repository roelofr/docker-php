###
#
# Makefile for Docker files
#
# Just run make
#
###

# Define 'fake' files
.PHONY: default build

### Create Dockerfiles ###
default: php/Dockerfile php-fpm/Dockerfile php-apache/Dockerfile

php/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php php:7

php-fpm/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-fpm php:7-fpm

php-apache/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-apache php:7-apache

### Build Docker containers ###
build: build/php build/php-fpm build/php-apache

build/php: php/Dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php \
		--tag=roelofr/php:latest \
		--tag=roelofr/php:7-cli \
		--tag=roelofr/php:cli \
		php/

build/php-fpm: php-fpm/Dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:7-fpm \
		--tag=roelofr/php:fpm \
		php-fpm/

build/php-apache: php-apache/Dockerfile
	docker build \
		--pull=true \
		--compress=true \
		--tag=roelofr/php:7-apache \
		--tag=roelofr/php:apache \
		php-apache/
