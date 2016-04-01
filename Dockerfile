FROM php:7-sockets
MAINTAINER Sven Dowideit <SvenDowideit@home.org.au>

WORKDIR /var/www/html/
ADD . /var/www/html/

CMD php ./server.php
