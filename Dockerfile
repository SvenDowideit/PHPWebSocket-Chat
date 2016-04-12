FROM php:5-sockets
MAINTAINER Sven Dowideit <SvenDowideit@home.org.au>

RUN apt-get update \
	&& apt-get install -y nginx vim git \
	&& rm -r /var/lib/apt/lists/*

WORKDIR /var/www/html/

# process the composer.json
COPY composer.json /var/www/html/
RUN composer install

COPY . /var/www/html/

CMD ["/var/www/html/start.sh"]
