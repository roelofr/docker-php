###
#
# Makefile for Docker files
#
# Just run make
#
###

# Define 'fake' files
.PHONY: default configure build push

### Update image config and build them all
default: configure build

# Create Docker build files
configure: dockerfile
	./docker-configure

# Build Docker containers
build:  cli/latest/Dockerfile fpm/latest/Dockerfile apache/latest/Dockerfile
	./docker-build

### Publish Docker containers
push:
	docker push \
		--disable-content-trust=false \
		roelofr/php
