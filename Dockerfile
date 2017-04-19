FROM ubuntu

RUN apt-get update \
    && apt-get install -y python python-software-properties software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated php7.1 php7.1-fpm php7.1-curl php7.1-gd php7.1-mbstring php7.1-opcache 

CMD php -v
