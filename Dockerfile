# Configuration file for Docker
FROM IMAGE

# Install dependencies for extensions
RUN apt-get update \
  && apt-get install -y \
    bzip2 \
    git \
    libc6-dev \
    libcurl4-gnutls-dev \
    libmcrypt-dev \
    libmcrypt4 \
    libsqlite3-0 \
    libsqlite3-dev \
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
  && rm -rf /var/cache/apt /var/lib/apt /var/lib/dpkg /var/log

# Install extensions
RUN docker-php-ext-install \
    curl \
    dom \
    json \
    mbstring \
    pcntl \
    pdo \
    pdo_mysql \
    simplexml \
    xml \
    zip \
  && docker-php-source delete

# Install Composer
COPY ./install-composer.sh /usr/src/install-composer.sh
RUN /usr/src/install-composer.sh

# Install XDebug
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && rm -rf /tmp/pear
