FROM php:7.4-cli

RUN pecl config-set php_ini "${PHP_INI_DIR}/php.ini"
RUN pecl install xdebug
COPY docker/90-xdebug.ini "${PHP_INI_DIR}/conf.d"

EXPOSE 8111

CMD cd /demo && php -d display_errors=0 -S 0.0.0.0:8111 -t web/
