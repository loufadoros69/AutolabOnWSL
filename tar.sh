#!/bin/bash

function removeExec () {
	SAVEIFS=$IFS
	IFS=$(echo -en "\n\b")
	FILES=$1
	FILES+=/*
	for f in $FILES
	do
		# echo "$f"
		if [ -d "$f" ]; then
			removeExec "$f"
		elif [ -e "$f" ]; then
			chmod a-x "$f"
		fi
	done
	# restore $IFS
	IFS=$SAVEIFS
}

if [ $# -gt 2 ] || [ $# -lt 1 ]
then
    echo "Wrong arguments"
    echo "Usage: $0 <folder_to_be_uploaded> <filename of .tar.gz or leave blank for default>"
    exit -1
fi
export cwd=$(pwd)
export folder_tbu=$1
if [ ${folder_tbu:${#folder_tbu}-1} == "/" ]
then
    export folder_tbu=${folder_tbu%/}
fi

if [ ${folder_tbu:0:1} = '/' ]
then
	
	export temp=${folder_tbu##/*/}
	if [ $temp = $folder_tbu ]
	then 
		export temp=${folder_tbu:1}
	fi

elif [ ${folder_tbu:0:3} = "../" ]
then
	
	export temp=${folder_tbu##../*/}
	if [ $temp = $folder_tbu ]
	then
		export temp=${folder_tbu:3}
	fi
else 
	export temp=$folder_tbu
fi
# echo $folder_tbu
# echo $temp
if [ -d $folder_tbu ] 
then
	export temp_folder=$(mktemp -d)
	# echo $temp_folder
	cp -r $folder_tbu $temp_folder/$temp
	cd $temp_folder/$temp
	file="$temp_folder/$temp"
	removeExec $file
	cd ../
	if [ $# -eq '2' ]
	then
		export name=$2
	else
		name=${temp,,}
	fi	
	tar -czvf $name.tar.gz $temp/
	cp $name.tar.gz "$cwd"
	rm -r $temp_folder
	cd "$cwd"
	echo "DONE"
	exit 0
else
    echo "error: Folder $folder_tbu doesn't exist at all. Aborting!"
    exit 1
fi