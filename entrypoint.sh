#!/bin/bash

# Ensure the themes and plugins directories exist
mkdir -p /var/www/html/wp-content/themes/
mkdir -p /var/www/html/wp-content/plugins/

# Copy the themes and plugins
cp -r /tmp/themes/* /var/www/html/wp-content/themes/
cp -r /tmp/plugins/* /var/www/html/wp-content/plugins/

# Execute whatever command is given
exec "$@"
