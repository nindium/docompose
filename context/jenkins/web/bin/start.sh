#!/bin/bash

# Start sshd

/usr/sbin/sshd

# Start php processes in the background

/usr/sbin/php-fpm -c /etc/php/fpm

# Starting nginx 

nginx -g 'daemon off;'


