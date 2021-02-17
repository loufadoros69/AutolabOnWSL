#!/usr/bin/bash
# KOITAJTE TIS ODHGIES STO MAIN PAGE

if [ $# -ne '1' ] 
then
    echo "Wrong arguments"
    echo "Usage: ./autolab.sh <folder_to_be_uploaded>"
    exit -1
fi
export cwd=$(pwd)
export folder_tbu=$1
if [ ${folder_tbu:${#folder_tbu}-1} == "/" ]
then
    export folder_tbu=${folder_tbu%/}
fi

if [ -d $folder_tbu ] 
then
	export temp_folder=$(mktemp -d)
    cp -r $folder_tbu $temp_folder/$folder_tbu
	cd $temp_folder/$folder_tbu
    chmod a-x *
	cd ../
    tar -czvf $folder_tbu.tar.gz $folder_tbu/
    cp $folder_tbu.tar.gz "$cwd"
	rm -r $temp_folder
	cd "$cwd"
    echo "DONE"
    exit 0
else
    echo "error: Folder $folder_tbu doesn't exist at all. Aborting!"
    exit 1
fi
