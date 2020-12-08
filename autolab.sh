#!/usr/bin/bash
# molis to katevasete, kante chmod +x autolab.sh gia na mporesei na ektelestei
# oi fakeloi kai ta directories prepei na alaxtoun apo ton teliko xrhsth

cp -r hw2submit ~/
cd ~/hw2submit
chmod a-x *
cd ../
tar -czvf hw2submit.tar.gz hw2submit/
cp hw2submit.tar.gz /mnt/c/Users/Nikos\ Stylianou/Documents/UTh/Domes/HW2/
rm -rf hw2submit*
cd /mnt/c/Users/Nikos\ Stylianou/Documents/UTh/Domes/HW2/
