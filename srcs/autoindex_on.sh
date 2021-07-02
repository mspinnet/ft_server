#!/bin/bash
mv etc/nginx/sites-enabled/autoindex_off.conf etc/nginx/sites-available
mv etc/nginx/sites-available/nginx.conf etc/nginx/sites-enabled
service nginx restart
echo "autoindex on"