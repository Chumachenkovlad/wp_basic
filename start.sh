
#make wp-config with ENV parameters
$WP_CLI core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --skip-check --extra-php <<PHP
\$_SERVER['HTTPS'] = 'on';
\$_SERVER[ 'SERVER_NAME' ] = \$_SERVER['HTTP_HOST'];
define('WP_HOME', 'https://' . \$_SERVER['HTTP_HOST']);
define('WP_SITEURL', 'https://' . \$_SERVER['HTTP_HOST']);
define('WP_CONTENT_URL', '/wp-content');
define('DOMAIN_CURRENT_SITE', \$_SERVER['HTTP_HOST']);
PHP

# Change wp-admin to $LOGIN_FILE
if [ $BUILD_MODE = "LOCAL" ]; then
	sed -i "s/https:/http:/g" $DOCUMENT_ROOT/wp-config.php
	sed -i "s/= 'on'/= 'off'/g" $DOCUMENT_ROOT/wp-config.php
fi

chown -R www-data.www-data $DOCUMENT_ROOT

service php5-fpm start && nginx