ARG PHP_VERSION=8.1
FROM php:${PHP_VERSION}-alpine

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
ENV PATH "$PATH:/root/.composer/vendor/bin"

RUN apk add --no-cache libxslt-dev && docker-php-ext-install xsl

RUN composer global require edgedesign/phpqa --update-no-dev

ENTRYPOINT ["docker-php-entrypoint"]
