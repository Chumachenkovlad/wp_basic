#/bin/bash
#$WP_CLI = wp --path='/usr/share/nginx/html' --allow-root

$WP_CLI core install --url=$WP_URL --title='development' --admin_user=$WP_LOGIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL --skip-email \
    && $WP_CLI plugin activate --all \
    && $WP_CLI theme activate $WP_THEME