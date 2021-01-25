#!/bin/bash
echo "myuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo lsblk > terrafile
sudo mkdir /data2
yes | sudo mkfs.ext4 /dev/sdb
sudo mount /dev/sdb /data2
