#!/bin/bash

if [ -f "/var/www/html/wp-config.php" ]
then
    echo "The wordpress is ready"
else

    cd /var/www/html
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    sleep 10
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST_DB} --allow-root
    ./wp-cli.phar core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
    ./wp-cli.phar user create ${WP_USER_NAME} ${WP_USER_EMAIL} --role=${WP_USER_ROLE} --user_pass=${WP_USER_PASS} --allow-root
    ./wp-cli.phar user list --allow-root
    rm -f wp-cli.phar
fi
exec php-fpm7.4 -F
