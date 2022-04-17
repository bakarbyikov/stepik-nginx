#!/bin/bash
#files unpackaging
rm -r /home/box/web
cp -r ./web /home/box/web

#python modules installing
python3 -m pip install django==2

#database startup
/etc/init.d/mysql start
mysql -uroot -e "create database database_ask"

#django migrations
sh web/ask/migrate.sh

#nginx startup
rm /etc/nginx/sites-enabled/default
ln -f -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
/etc/init.d/nginx restart

#gunicorn service add
ln -s /home/box/web/etc/gunicorn_hello.service /etc/systemd/system/
ln -s /home/box/web/etc/gunicorn_django.service /etc/systemd/system/

#gunicorn service start
sudo systemctl daemon-reload
sudo systemctl start gunicorn_hello
sudo systemctl start gunicorn_django
sudo systemctl enable gunicorn_hello
sudo systemctl enable gunicorn_django