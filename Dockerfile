FROM php:8.2-apache

COPY ./index.html /var/www/html/index.html

EXPOSE 80