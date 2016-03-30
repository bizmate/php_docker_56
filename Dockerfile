FROM php:5-fpm
MAINTAINER Diego Gullo <diego_gullo@gmail.com>

RUN apt-get -y update

#apt-get install php5-gd php5-mcrypt php-calendar php-gettext php5-intl php5-xdebug

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring gettext intl xdebug calendar gettext\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
