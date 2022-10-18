#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx