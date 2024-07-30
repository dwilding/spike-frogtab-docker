FROM php:8.3-apache

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/www/internal \
    && cd /var/www/internal \
    && git clone https://github.com/dwilding/frogtab.git \
    && mkdir installed \
    && mv frogtab/app frogtab/server frogtab/dev_build_server.sh installed \
    && rm -rf frogtab \
    && rm -rf /var/www/html \
    && mv installed/app /var/www/html \
    && chown -R www-data:www-data /var/www/internal /var/www/html

EXPOSE 80
