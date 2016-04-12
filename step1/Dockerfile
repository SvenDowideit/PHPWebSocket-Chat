FROM php:7-sockets
MAINTAINER Sven Dowideit <SvenDowideit@home.org.au>

RUN apt-get update \
	&& apt-get install -y nginx vim php5-redis libphp-predis \
	&& rm -r /var/lib/apt/lists/*

WORKDIR /var/www/html/
COPY . /var/www/html/
ADD https://getcomposer.org/installer /tmp
RUN php /tmp/installer
RUN php composer.phar install

CMD ["/var/www/html/start.sh"]
