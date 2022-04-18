#!/bin/bash

cd home/box/web/ask/

python3 manage.py makemigrations
python3 manage.py migrate