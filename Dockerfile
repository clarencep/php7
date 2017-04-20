FROM centos:6

ENV PHP_VERSION 7.1

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm  \
    && yum install -y mod_php71w php71w-{cli,opcache,fpm,common,gd,intl,mbstring,mcrypt,mysqlnd,pdo,soap,xml} \
    && yum clean all

CMD php -v && php -m
