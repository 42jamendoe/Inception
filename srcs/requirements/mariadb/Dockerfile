FROM debian:bullseye

LABEL authors="jamendoe"

EXPOSE 3306

RUN apt update && apt install -y \
mariadb-server && \
rm -rf /var/lib/apt/lists/* && \
mkdir -p /run/mysqld /var/lib/mysql && \
chown -R mysql:mysql /run/mysqld /var/lib/mysql
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/mariadb.sh

CMD ["/usr/local/bin/mariadb.sh"]
