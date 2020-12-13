#!/usr/bin/bash
# kante copy paste to arxeio se enan text editor kai apo8hkeyste to ws autolab.sh
# molis to katevasete, kante chmod +x autolab.sh gia na mporesei na ektelestei

export cwd=$cwd$(pwd)
cd source_code
cp dlist.c dlist.h sort.c sort.h sort1.c tree.c tree.h tree1.c tree2.c ../hw2submit/
cd "$cwd"
cp -r hw2submit ~/
cd ~/hw2submit
chmod a-x *
cd ../
tar -czvf hw2submit.tar.gz hw2submit/
cp hw2submit.tar.gz "$cwd"
rm -rf hw2submit*
cd "$cwd"
