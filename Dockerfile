FROM alpine:latest
LABEL maintainer="support@tutum.com"
RUN apk --update add nginx php-fpm
RUN mkdir -p /tmp/nginx && echo "clear_env = no" >> /etc/php7/php-fpm.conf
ADD www /www
ADD nginx.conf /etc/nginx/
EXPOSE 80
CMD php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;pid /tmp/nginx.pid;"
