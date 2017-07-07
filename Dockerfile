FROM cvla/nginx-light:first
# nginx config
RUN sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf \
  	 && sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 10m/" /etc/nginx/nginx.conf \
  	 && sed -i -e "s|include /etc/nginx/conf.d/\*.conf|include /etc/nginx/sites-enabled/\*|g" /etc/nginx/nginx.conf \
  	 && echo "daemon off;" >> /etc/nginx/nginx.conf

# php-fpm config
RUN     sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini \
  	 && sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = 10M/g" /etc/php5/fpm/php.ini \
  	 && sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = 10M/g" /etc/php5/fpm/php.ini \
  	 && sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf \
  	 && sed -i -e "s/;listen.mode = 0660/listen.mode = 0666/g" /etc/php5/fpm/pool.d/www.conf

# Download WordPress CLI
RUN curl -L "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" > /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

ENV WP_CLI wp --path='/usr/share/nginx/html' --allow-root

# Install Wordpress Site
RUN ${WP_CLI} core download


ENV WP_URL default
ENV WP_LOGIN default
ENV WP_PASS default
ENV WP_EMAIL default
ENV WP_THEME default

ENV DB_NAME dbname
ENV DB_USER root
ENV DB_PASS dSMm40AkZ?
ENV DB_HOST db
ENV LOGIN_FILE login
ENV TERM xterm

RUN mkdir /etc/nginx/sites-available/
ADD default /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled \
  	 && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD wp-content ${DOCUMENT_ROOT}/wp-content

ADD ./robots.txt ${DOCUMENT_ROOT}/robots.txt

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

# Wordpress
ENV BUILD_MODE "PROD"
EXPOSE 80
EXPOSE 443

CMD ["/bin/bash", "/start.sh"]
