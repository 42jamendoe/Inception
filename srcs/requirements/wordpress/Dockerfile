FROM debian:bullseye

LABEL authors="jamendoe"

EXPOSE 9000

RUN apt update && apt install -y \
    php7.4-fpm \
    php7.4-mysqli \
    curl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh

CMD ["/usr/local/bin/wordpress.sh"]
