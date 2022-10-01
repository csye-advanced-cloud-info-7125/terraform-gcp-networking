#!/bin/bash
sudo apt update -y
sleep 20
sudo apt -y install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
