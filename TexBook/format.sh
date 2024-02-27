#!/usr/bin/bash

# For files in ./Files
#       Store $num and $name
#       Append "$num $name" to titles.txt
#       Rename file as $num.md
# Compile
# Rename all files as $num_$name.md

function remove_name() {
	for file_name in $(ls Files); do
		num=$(echo $file_name | sed -n 's/\([0-9]*\)_.*$/\1/p')
		name=$(echo $file_name \
			| sed -n 's/[0-9]_\(\S*\)\.md$/\1/p')

		grep -qF "$num $name" titles.txt 2>&1
		if [ $? -ne 0 ]; then
			echo "$num $name" >> titles.txt
		fi
		if [ -n "$num" ]; then
			mv Files/"$file_name" Files/$num.md
		fi
	done
}

function restore_name() {
	for file_name in $(ls Files); do
		num=$(echo $file_name | sed -n 's/\([0-9]*\)\.md$/\1/p')
		name=$(grep -w "$num" titles.txt | awk '{ print $2 }')

		if [ -n "$num" ] && [ -n "$name" ]; then
			mv Files/"$num".md Files/"$num"_"$name".md
		fi
	done
}
