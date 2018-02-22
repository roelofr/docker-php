###
#
# Makefile for Docker files
#
# Just run make
#
###

.PHONY: default

default: php/Dockerfile php-fpm/Dockerfile php-apache/Dockerfile

php/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php php:7

php-fpm/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-fpm php:7-fpm

php-apache/Dockerfile: Dockerfile install-composer.sh build-dockerfile
	./build-dockerfile php-apache php:7-apache
