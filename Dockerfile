FROM php:8.2-apache

COPY ./public/index.php /var/www/html/
COPY index.html /var/www/html/

EXPOSE 80