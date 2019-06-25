FROM php:7.3-cli
LABEL maintainer="Chris Kankiewicz <Chris@ChrisKankiewicz.com>"

ENV COMPOSER_HOME=/root/.config/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH=${COMPOSER_HOME}/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer
COPY .docker/.bash_extras /root/.bash_extras
RUN echo 'source ~/.bash_extras' >> ~/.bashrc

RUN apt-get update && apt-get install -y bash-completion ca-certificates git \
    libmemcached-dev libzip-dev nano unzip wget zlib1g-dev zip \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install zip
RUN pecl install -f apcu apcu_bc memcached redis
RUN docker-php-ext-enable apcu memcached redis
RUN echo "apc.enable_cli = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

RUN composer global require hirak/prestissimo
RUN composer global require stecman/composer-bash-completion-plugin dev-master

WORKDIR /root/demo
    
ENTRYPOINT ["bash"]
