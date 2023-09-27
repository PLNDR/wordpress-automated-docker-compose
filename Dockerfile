ARG WORDPRESS_VERSION
FROM wordpress:${WORDPRESS_VERSION}

# Copy php config to directory
COPY ./config/php.conf.ini /usr/local/etc/php/conf.d/php.ini

# Copy themes and plugins directly to the expected directories
COPY ./themes /themes/
COPY ./plugins /plugins/