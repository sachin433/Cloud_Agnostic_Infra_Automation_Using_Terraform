#!/bin/bash
sudo su -
useradd myuser
sudo cp /etc/sudoers /root/sudoers.bak
echo "myuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
