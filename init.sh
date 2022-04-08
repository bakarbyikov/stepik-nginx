#!/bin/bash
rm -r /home/box/web
cp -r ./web /home/box/web

rm /etc/nginx/sites-enabled/default
ln -f -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
/etc/init.d/nginx restart

sh /home/box/web/etc/start_gunicorn.sh
