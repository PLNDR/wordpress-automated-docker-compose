install:

	@echo "⚙️ Configuring Wordpress parameters..."
	@if ! wp core is-installed; then \
		wp core download; \
	fi

	@if [ ! -f wp-config.php ]; then \
	wp config create \
		--dbname=${DATABASE_NAME} \
		--dbuser=${DATABASE_USER} \
		--dbpass=${DATABASE_PASSWORD} \
		--dbhost=${DATABASE_HOST}; \
	fi

	wp core install \
		--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
		--title="$(WORDPRESS_WEBSITE_TITLE)" \
		--admin_user="${WORDPRESS_ADMIN_USER}" \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL}

	wp option update siteurl ${WORDPRESS_WEBSITE_URL}
	wp rewrite structure $(WORDPRESS_WEBSITE_POST_URL_STRUCTURE)
	wp language core install ${WORDPRESS_LOCALE} --activate
	wp theme install ${WORDPRESS_THEME}
	wp theme list
	wp plugin list
	wp theme activate ${WORDPRESS_CHILD_THEME}
	wp plugin activate ${WORDPRESS_PLUGINS} --allow-root --path=/var/www/html/