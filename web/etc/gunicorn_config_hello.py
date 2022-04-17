bind = '0.0.0.0:8080'
workers = 3

accesslog = "/var/log/gunicorn/hello/access.log"
errorlog = "/var/log/gunicorn/hello/error.log"
# Whether to send Django output to the error log 
capture_output = True
loglevel = "info"