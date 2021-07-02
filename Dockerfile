# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/29 14:23:56 by mspinnet          #+#    #+#              #
#    Updated: 2020/12/05 15:01:38 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx wget mariadb-server php7.3-mysql php7.3-fpm

WORKDIR /etc/nginx/
COPY /srcs/nginx.conf ./sites-enabled
COPY /srcs/autoindex_off.conf ./sites-available
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mspinnet.key -out mspinnet.crt -subj "/C=RF/ST=TATARSTAN/L=KAZAN/O=21S/CN=MSPINNET"

WORKDIR /../../var/www/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-4.9.7-all-languages.tar.gz && rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz
COPY /srcs/wp-config.php ./wordpress

WORKDIR ../../
COPY /srcs/skript.sh ./
COPY /srcs/autoindex_off.sh ./
COPY /srcs/autoindex_on.sh ./

EXPOSE 80 443

CMD bash skript.sh
