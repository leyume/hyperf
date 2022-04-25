FROM alpine:edge

RUN apk add --no-cache \
    php8 \
    php8-common \
    php8-mbstring \
    php8-iconv \
    php8-curl \
    php8-bz2 \
    php8-json \
    php8-ctype \
    php8-mysqli \
    php8-mysqlnd \
    php8-openssl \
    php8-sockets \
    php8-opcache \
    php8-pcntl \
    php8-pdo \
    php8-pdo_mysql \
    php8-phar \
    php8-redis \
    php8-tokenizer \
    php8-dom \
    php8-xml \
    php8-xmlwriter \
    php8-pecl-redis \
    php8-gd \
    php8-mbstring \
    bash \
    curl \
    # g++ \
    php8-pecl-swoole --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN echo "swoole.use_shortname = 'Off'" >> /etc/php8/conf.d/50_swoole.ini 

RUN curl -sS https://getcomposer.org/installer | php8 -- --install-dir=/usr/bin --filename=composer

#RUN ln -s /usr/bin/php8 /usr/bin/php

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1


WORKDIR /app

ADD ./docker-entrypoint.sh ./watch.php /usr/bin/
ENTRYPOINT [ "sh", "/usr/bin/docker-entrypoint.sh" ]