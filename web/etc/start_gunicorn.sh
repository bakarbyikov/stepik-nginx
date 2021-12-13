#!/bin/bash
(cd /home/box/web && gunicorn -c /home/box/web/etc/gunicorn_config.py hello:app)
