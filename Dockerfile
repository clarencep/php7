FROM ubuntu:16.04

ENV PHP_VERSION 7.1

RUN DEBIAN_FRONTEND="noninteractive" \
    # && sed 's/archive.ubuntu.com/mirrors.aliyun.com/' -i.bak /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y python python-software-properties software-properties-common \
    && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E5267A6C \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
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
    && find /var/log -type f -print0 | xargs -0 rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* 

CMD php -i
