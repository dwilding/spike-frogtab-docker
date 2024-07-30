FROM php:8.3-apache

RUN mkdir /var/www/internal
COPY internal/ /var/www/internal/
RUN chown -R www-data:www-data /var/www/internal

COPY public/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
