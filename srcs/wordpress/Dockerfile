# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vpiamias <vpiamias@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/13 22:11:50 by kmeeseek          #+#    #+#              #
#    Updated: 2022/03/04 16:19:39 by vpiamias         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y \
	php7.3 \
	php-fpm \
	php-cli \
	wget \
	curl \
	php-mysql \
	php-mbstring \
	php-xml \
	sendmail \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /run/php

RUN wget https://wordpress.org/wordpress-5.8.3.tar.gz \
	&& tar -xvzf wordpress-5.8.3.tar.gz \
	&& rm -rf wordpress-5.8.3.tar.gz

COPY tools/docker-entrypoint.sh /usr/local/bin/
COPY tools/wp-config.php /
COPY tools/wp-cli.phar /usr/local/bin/wp-cli
RUN chmod 777 /usr/local/bin/wp-cli

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "./usr/sbin/php-fpm7.3", "-F" ]
