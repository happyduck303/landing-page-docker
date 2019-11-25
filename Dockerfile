FROM nginx

WORKDIR /var/www/html

COPY . /var/www/html

COPY default.conf /etc/nginx/conf.d/default.conf
