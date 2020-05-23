FROM php:7.3-cli-alpine

RUN apk add --update --no-cache --virtual \
    .build-deps autoconf make g++ php7-dev zlib-dev pcre-dev

RUN pecl install swoole \
    && docker-php-ext-enable swoole

COPY  index.php /var/www

EXPOSE 8080

ENTRYPOINT [ "php", "/var/www/index.php", "start" ]