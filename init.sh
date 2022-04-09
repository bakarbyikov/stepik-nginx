#!/bin/bash
#files unpackaging
rm -r /home/box/web
cp -r ./web /home/box/web

#python modules installing
python3 -m pip install django==2

#database startup
/etc/init.d/mysql start
mysql -uroot -e "create database database_ask"

#nginx startup
rm /etc/nginx/sites-enabled/default
ln -f -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
/etc/init.d/nginx restart

#gunicorn startup
sh /home/box/web/etc/start_gunicorn.sh
