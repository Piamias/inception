#!/bin/bash

sed -ie s/'$DOMAIN_NAME'/$DOMAIN_NAME/g /etc/nginx/sites-available/wordpress.conf

openssl req -x509 -nodes -days 365 -subj "/C=PT/ST=Portugal/L=Lisbon/O=42lisbon/CN=dcavalei" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

exec "$@"
