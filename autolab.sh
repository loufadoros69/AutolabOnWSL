#!/usr/bin/bash

cp -r hw2submit ~/
cd ~/hw2submit
chmod a-x *
cd ../
tar -czvf hw2submit.tar.gz hw2submit/
cp hw2submit.tar.gz /mnt/c/Users/Nikos\ Stylianou/Documents/UTh/Domes/HW2/
rm -rf hw2submit*
cd /mnt/c/Users/Nikos\ Stylianou/Documents/UTh/Domes/HW2/
