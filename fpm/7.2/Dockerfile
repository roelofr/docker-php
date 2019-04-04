###########################################################
#                                                         #
# THIS FILE HAS BEEN AUTOMATICALLY GENERATED. DO NOT EDIT #
# IF YOU NEED TO MAKE CHANGES, EDIT THE /dockerfile FILE! #
#                                                         #
###########################################################
# Configuration file for Docker
FROM php:7.2-fpm

# Install dependencies for extensions
RUN apt-get update \
  && apt-get install -y \
    bzip2 \
    git \
    libc6-dev \
    libcurl4-gnutls-dev \
    libgd-dev \
    libmcrypt-dev \
    libmcrypt4 \
    libsqlite3-0 \
    libsqlite3-dev \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    libxslt1.1 \
    libzip-dev \
    libzip4 \
    sqlite3 \
    unzip \
    wget \
    zip \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt /var/lib/apt /var/log/*

# Install extensions
RUN docker-php-ext-install \
    bcmath \
    curl \
    dom \
    gd \
    json \
    mbstring \
    mysqli \
    pcntl \
    pdo \
    pdo_mysql \
    pdo_sqlite \
    simplexml \
    xml \
    zip \
  && docker-php-source delete

# Install Composer
COPY ./install-composer.sh /usr/src/install-composer.sh
RUN /usr/src/install-composer.sh

# Install XDebug
RUN pecl install xdebug-stable \
  && docker-php-ext-enable xdebug \
  && rm -rf /tmp/pear