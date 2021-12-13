#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def app(environ, start_response): 
    # бизнес-логика  
    status = '200 OK' 
    headers = [ 
        ('Content-Type', 'text/plain') 
    ]
    
#    body = environ['QUERY_STRING'].split('&')
#    body = map(str.encode, body)
    body = environ['QUERY_STRING'].split('&')
    body = [(s+'\n').encode() for s in body]
    start_response(status, headers) 
    return body

#env = {'QUERY_STRING': '/?a=1&a=2&b=3'}
#f = lambda x: x
#wsgi_application(f)