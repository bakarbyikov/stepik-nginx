#!/bin/bash
cp -r ./web ~/web

sudo ln -f -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
