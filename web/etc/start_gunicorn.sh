#!/bin/bash
gunicorn -c /home/box/web/etc/gunicorn_config.py --chdir /home/box/web hello:app --daemon
gunicorn -c /home/box/web/etc/gunicorn_config_django.py --chdir /home/box/web/ask ask.wsgi --daemon
