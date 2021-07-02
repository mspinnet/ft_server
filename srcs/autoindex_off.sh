#!/bin/bash
mv etc/nginx/sites-enabled/nginx.conf etc/nginx/sites-available
mv etc/nginx/sites-available/autoindex_off.conf etc/nginx/sites-enabled
service nginx restart
echo "autoindex off"