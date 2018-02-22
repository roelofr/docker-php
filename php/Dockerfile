###########################################################
#                                                         #
# THIS FILE HAS BEEN AUTOMATICALLY GENERATED. DO NOT EDIT #
# IF YOU NEED TO MAKE CHANGES, EDIT THE /Dockerfile FILE! #
#                                                         #
###########################################################
# Configuration file for Docker
FROM php:7

# Install dependencies and extensions for PHP
RUN apt-get update \
  && apt-get install -y \
    git \
    wget bzip2 \
    zip unzip \
    sqlite3 \
    libc6-dev \
    libcurl4-gnutls-dev \
    libsqlite3-0 libsqlite3-dev \
    libxml2 libxml2-dev \
    libmcrypt4 libmcrypt-dev \
    libxslt1.1 libxslt1-dev \
    libzip4 libzip-dev \
    zlib1g-dev \
  && docker-php-ext-install \
    curl mbstring xml json zip \
    pdo pdo_mysql \
    dom simplexml \
    pcntl \
  && docker-php-source delete \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY ./install-composer.sh /usr/src/install-composer.sh
RUN /usr/src/install-composer.sh
