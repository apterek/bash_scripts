#!/bin/bash
mkdir ssl
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -subj /CN=localhost -keyout ./ssl/nginx.key -out ./ssl/nginx.crt
