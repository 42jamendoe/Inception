#!/bin/bash

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]
    then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    mysqld &
    while ! mysqladmin ping --silent
    do
        sleep 1
    done
    {
    echo "CREATE DATABASE ${MYSQL_DATABASE};"
    echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    echo "FLUSH PRIVILEGES;"
    } > init.sql

    mysql < init.sql
    rm -f init.sql
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown
fi
exec mysqld
