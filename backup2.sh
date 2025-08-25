#!/bin/bash

#$@ represent as the array of all the parameters passe
#$# represent as the number of parameters passed

# Use the modern syntax for command substitution
DATE=$(date "+%Y-%m-%d-%H%M%S")

# Define the full path to the backup directory
BACKUP_DIR="$HOME/backups"

# Initialize a flag for verbose mode
VERBOSE=false

# The -p flag will create the directory if it doesn't exist,
# and do nothing if it does.
mkdir -p "$BACKUP_DIR"

#Check if the command arguments provided, exit if not
if [ 0 = "$#" ]; then
	echo "Usage: ./backup2.sh file1 file2 ..."
	exit 1
fi

while getopts "hv" opt
do
	case "${opt}" in
		h) 
	        echo "Usage: $(basename "$0") [-h] [-v] file1 [file2 ...]"
			echo "Backs up specified files to the $BACKUP_DIR directory."
            echo "  -h          Display this help message and exit."
            echo "  -v          Enable verbose mode to show backup progress."
			exit 0
			;;	
		v) 
			VERBOSE=true
			;;
		\?)
			# Handle invalid options
			echo "Invalid option: -${OPTARG}" >&2
			exit 1
			;;
	esac  
done

# Shift off the options so the remaining arguments are only file paths
shift "$((OPTIND-1))"

#Functions
backup_file(){
	local item="$1"

	if [ -f "$item" ]; then
		if [ "$VERBOSE" = true ]; then
			echo "Backing up file: '$item' ..."
		fi
		file_name=$(basename "$item");
    	cp "$item" "$BACKUP_DIR/$DATE-$file_name"
		
		if [ "$VERBOSE" = true ]; then
		echo "Backed up file: '$item' to '$BACKUP_DIR/$DATE-$file_name'."
		fi
	elif [ -d "$item" ]; then
		if [ "$VERBOSE" = true ]; then
            echo "Processing directory: '$item'..."
        fi
		find "$item" -type f | while read -r file_to_backup; do
			if [ "$VERBOSE" = true ]; then
				echo "Backing up file: '$file_to_backup' ..."
			fi
			file_name=$(basename "$file_to_backup");
    		cp "$file_to_backup" "$BACKUP_DIR/$DATE-$file_name"
		
			if [ "$VERBOSE" = true ]; then
				echo "Backed up file: '$file_to_backup' to '$BACKUP_DIR/$DATE-$file_to_backup'."
			fi
		done
	else
		echo "Warning: File '$item' not a file" >&2
	fi
}

for arg in "$@"
do

	backup_file "$arg"

done

