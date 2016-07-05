.PHONY: default build php5 php7 run shell port-forwards

default: build run

pull:
	docker pull svendowideit/php-websocket-chat
	docker pull svendowideit/php-websocket-chat:nginx
	docker pull redis

build:
	docker build -t svendowideit/php-websocket-chat .
	docker build -t svendowideit/php-websocket-chat:nginx nginx

php5:
	 docker build -t svendowideit/php:5-sockets php5

php7:
	 docker build -t svendowideit/php:7-sockets php7

run:
	docker run --rm -it -p 80:80 -p 9300:9300 sendowideit/php-websocket-chat
	#docker run --rm -it --net host php-websocket-chat

shell:
	docker run --rm -it --net host svendowideit/php-websocket-chat bash

# for windows using hyper-v
port-forwards:
	echo "needs to run as admin user"
	netsh interface portproxy add v4tov4 listenport=80 connectaddress=10.0.75.2 connectport=80 protocol=tcp
	netsh interface portproxy add v4tov4 listenport=9300 connectaddress=10.0.75.2 connectport=9300 protocol=tcp
