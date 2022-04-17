bind = '0.0.0.0:8000'
workers = 3

accesslog = "/var/log/gunicorn/django/access.log"
errorlog = "/var/log/gunicorn/django/error.log"
# Whether to send Django output to the error log 
capture_output = True
loglevel = "info"