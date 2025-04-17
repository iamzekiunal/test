FROM php:8.2-apache

COPY ./public/index.php /var/www/html/

EXPOSE 80