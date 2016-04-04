
default: build run

build:
	docker build -t php-websocket-chat .

php5:
	 docker build -t php:5-sockets -f Dockerfile.php5.6 .

php7:
	 docker build -t php:7-sockets -f Dockerfile.php7 .

run:
	#docker run --rm -it -p 80:80 -p 9300:9300 php-websocket-chat
	docker run --rm -it --net host php-websocket-chat

shell:
	docker run --rm -it --net host php-websocket-chat bash
