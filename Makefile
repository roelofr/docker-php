###
#
# Makefile for Docker files
#
# Just run make
#
###

.PHONY: default

default: php/Dockerfile php-fpm/Dockerfile php-apache/Dockerfile
