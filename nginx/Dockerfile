FROM nginx:alpine

COPY * /usr/share/nginx/html/

# listen on all network interfaces
RUN sed -i~ 's/ 80;/ *:80;/g' /etc/nginx/conf.d/default.conf
