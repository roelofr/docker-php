###########################################################
#                                                         #
# THIS FILE HAS BEEN AUTOMATICALLY GENERATED. DO NOT EDIT #
# IF YOU NEED TO MAKE CHANGES, EDIT THE /dockerfile FILE! #
#                                                         #
###########################################################
# Configuration file for Docker
FROM php:fpm

# Install dependencies for extensions
RUN apt-get update \
  && apt-get install -y \
    automake \
    bzip2 \
    git \
    libc6-dev \
    libcurl4-gnutls-dev \
    libfreetype6-dev \
    libgd-dev \
    libmcrypt-dev \
    libmcrypt4 \
    libsqlite3-0 \
    libsqlite3-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    libzip4 \
    make \
    sqlite3 \
    unzip \
    wget \
    zip \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/cache/apt /var/lib/apt /var/log/*

# Install oniguruma
RUN git clone https://github.com/kkos/oniguruma.git /usr/src/oniguruma \
    && cd /usr/src/oniguruma \
    && autoreconf -vfi \
    && ./configure \
    && make \
    && make install \
    && cd /root/ \
    && rm -rf /usr/src/oniguruma

# Configure and install extensions
RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include \
    --with-jpeg-dir=/usr/include \
    --with-png-dir=/usr/include \
    --with-webp-dir=/usr/include \
    --with-xpm-dir=/usr/include \
  && docker-php-ext-install \
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
RUN pecl install xdebug-beta \
  && docker-php-ext-enable xdebug \
  && rm -rf /tmp/pear
