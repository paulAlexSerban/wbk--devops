FROM php:7.4-fpm-alpine

# standard server on web server to serve your website from
WORKDIR /var/www/html

RUN docker-php-ext-install pdp pdo_mysql