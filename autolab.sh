#!/usr/bin/bash
# kante copy paste to arxeio se enan text editor kai apo8hkeyste to ws autolab.sh
# molis to katevasete, kante chmod +x autolab.sh gia na mporesei na ektelestei

export cwd=$cwd$(pwd)
cp -r folder_to_be_uploaded ~/
cd ~/folder_to_be_uploaded
chmod a-x *
cd ../
tar -czvf folder_to_be_uploaded.tar.gz folder_to_be_uploaded/
cp folder_to_be_uploaded.tar.gz "$cwd"
rm -rf folder_to_be_uploaded*
cd "$cwd"
