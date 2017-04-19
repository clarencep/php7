FROM ubuntu

ENV PHP_VERSION 7.1

RUN DEBIAN_FRONTEND="noninteractive" \
    && echo start... \
    && apt-get update -y \
    && apt-get install -y python python-software-properties software-properties-common \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E5267A6C \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update -y \
    && apt-get install -y php$PHP_VERSION \
                          php$PHP_VERSION-fpm \
                          php$PHP_VERSION-cli \
                          php$PHP_VERSION-json \
                          php$PHP_VERSION-readline \
                          php$PHP_VERSION-curl \
                          php$PHP_VERSION-gd \
                          php$PHP_VERSION-mysql \
                          php$PHP_VERSION-mbstring \
                          php$PHP_VERSION-opcache  \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get remove -y \
    && echo end.

CMD php -i
