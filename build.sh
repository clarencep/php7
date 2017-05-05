#!/bin/sh -xe

IMAGE_NAME=php7

docker build -t clarencep/$IMAGE_NAME .


docker run --rm clarencep/$IMAGE_NAME sh -c '\
    echo ""; \
    echo OS Version; \
    echo --------------; \
    cat /etc/*release;\
    echo ""; \
    echo PHP Version; \
    echo --------------; \
    php -v; \
    echo ""; \
    echo PHP Modules; \
    echo --------------; \
    php -m;' > versions.txt

docker run --rm clarencep/$IMAGE_NAME php -i > phpinfo.txt


