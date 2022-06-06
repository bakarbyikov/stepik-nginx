#!/bin/bash
#files unpackaging
# rm -r /home/box/web
#cp -r ./web /home/box/web

project_path=`pwd`

#paste path to templates
sed -i "s~dbms_template_path~$project_path~g" ./web/etc/nginx.conf ./web/etc/gunicorn_django.service ./web/etc/gunicorn_hello.service


read -p "Is installing for stepik? (y/n) " is_stepik 

if [ $is_stepik = "y" ]; then
    #install specific django
    python3 -m pip install django==2

    #database startup
    /etc/init.d/mysql start
    mysql -uroot -e "create database database_ask"
else
    #create static files for django admin
    python3 ${project_path}/web/ask/manage.py collectstatic --noinput
fi

#django migrations
python3 "${project_path}/web/ask/manage.py" makemigrations
python3 "${project_path}/web/ask/manage.py" migrate

#gunicorn startup
if [ is_stepik = 'y' ]; then
    gunicorn -c ${project_path}/web/etc/gunicorn_config.py --chdir ${project_path}/web hello:app --daemon
    gunicorn -c ${project_path}/etc/gunicorn_config_django.py --chdir ${project_path}web/ask ask.wsgi --daemon
else
    ln -f -s ${project_path}/web/etc/gunicorn_hello.service /etc/systemd/system
    ln -f -s ${project_path}/web/etc/gunicorn_django.service /etc/systemd/system
    systemctl daemon-reload
    systemctl start gunicorn_hello gunicorn_django
    systemctl enable gunicorn_hello gunicorn_django
fi

#nginx startup
rm /etc/nginx/sites-enabled/default
ln -f -s "${project_path}/web/etc/nginx.conf" /etc/nginx/sites-enabled/test.conf
/etc/init.d/nginx restart
