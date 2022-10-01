#!/bin/sh
sudo apt update -y
sudo apt -y install nginx
sudo nginx -v
sudo systemctl status ssh