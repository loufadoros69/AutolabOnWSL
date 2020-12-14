#!/usr/bin/bash
# KOITAJTE TIS ODHGIES STO MAIN PAGE

export cwd=$cwd$(pwd)
cp -r folder_to_be_uploaded ~/
cd ~/folder_to_be_uploaded
chmod a-x *
cd ../
tar -czvf folder_to_be_uploaded.tar.gz folder_to_be_uploaded/
cp folder_to_be_uploaded.tar.gz "$cwd"
rm -rf folder_to_be_uploaded/ folder_to_be_uploaded.tar.gz
cd "$cwd"
