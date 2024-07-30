FROM php:8.3-apache

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

RUN    echo "Enabling Apache modules..." \
    && a2enmod rewrite headers \
    && echo "Adding unzip..." \
    && apt-get update \
    && apt-get install -y unzip \
    && echo "Installing Frogtab..." \
    && mkdir /var/www/internal \
    && cd /var/www/internal \
    && curl -L https://github.com/dwilding/frogtab/archive/refs/heads/main.zip -o source.zip \
    && unzip source.zip \
    && mkdir installed \
    && mv frogtab-main/server frogtab-main/app frogtab-main/dev_build_server.sh installed \
    && rm -rf frogtab-main source.zip \
    && cd installed \
    && ./dev_build_server.sh \
    && rm -rf /var/www/html \
    && mv server/public /var/www/html \
    && rm -rf app dev_build_server.sh \
    && chown -R www-data:www-data /var/www/internal /var/www/html \
    && echo "Removing unzip..." \
    && apt-get remove --purge -y unzip \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
