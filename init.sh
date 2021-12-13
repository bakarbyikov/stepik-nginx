#!/bin/bash
sudo rm -r /home/box/web
sudo cp -r ./web /home/box/web

sudo ln -f -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo /home/box/web/etc/start_gunicorn.sh
