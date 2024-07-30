FROM php:8.3-apache

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/www/internal
RUN cd /var/www/internal; git clone https://github.com/dwilding/frogtab.git
RUN chown -R www-data:www-data /var/www/internal

COPY public/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
