FROM php:7.4-apache

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-enable pdo_mysql

RUN a2enmod rewrite

