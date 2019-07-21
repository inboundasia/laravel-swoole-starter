FROM composer:1.8.6 as vendor

COPY database/ database/

COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist

FROM zaherg/php-swoole:7.3

COPY --chown=www-data:www-data . /var/www
COPY --from=vendor --chown=www-data:www-data /app/vendor/ /var/www/vendor/

CMD [ "php", "artisan", "swoole:http", "start" ]
