#/bin/bash
#$WP_CLI  wp --path='/usr/share/nginx/html' --allow-root
#$DOCUMENT_ROOT  /usr/share/nginx/html
echo $DOCUMENT_ROOT/wp-content/$DB_NAME.sql
mysql --user=$DB_USER --host=$DB_HOST --password=$DB_PASS --database=$DB_NAME < $DOCUMENT_ROOT/wp-content/$DB_NAME.sql
rm $DOCUMENT_ROOT/wp-content/$DB_NAME.sql
echo dump has been installed

