#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def app(environ, start_response): 
    # бизнес-логика  
    status = '200 OK' 
    headers = [ 
        ('Content-Type', 'text/plain') 
    ]
    
    body = environ['QUERY_STRING']
    body = body.replace('&', '\n')
    body = body.encode()
    start_response(status, headers) 
    return [body]
