
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

# for windows using hyper-v
port-forwards:
	echo "needs to run as admin user"
	netsh interface portproxy add v4tov4 listenport=80 connectaddress=10.0.75.2 connectport=80 protocol=tcp
	netsh interface portproxy add v4tov4 listenport=9300 connectaddress=10.0.75.2 connectport=9300 protocol=tcp