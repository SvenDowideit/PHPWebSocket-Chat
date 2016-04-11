FROM php:7-sockets
MAINTAINER Sven Dowideit <SvenDowideit@home.org.au>

RUN apt-get update \
	&& apt-get install -y nginx vim php5-redis libphp-predis \
	&& rm -r /var/lib/apt/lists/*

WORKDIR /var/www/html/
ADD . /var/www/html/

CMD ["/var/www/html/start.sh"]
