#!/bin/bash

if [[ ! $1 ]]; then
    echo "Drectory path is expected. Usage of dir_rport.sh </path/to/directory>"
    exit 1
fi

directory_path=$1

if [[ ! -d $directory_path ]]; then
    echo "Error: Path is not a valid directory"
    exit 1
fi

file_count=$(find "$directory_path" -maxdepth 1 -type f | wc -l)
sub_directory_count=$(($(find "$directory_path" -maxdepth 1 -type d | wc -l)-1))

echo "File count is: $file_count"
echo "Sub directory count is: $sub_directory_count"