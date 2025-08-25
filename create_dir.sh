#!/bin/bash
DIRECTORY="my_new_project"

if [ -d "$DIRECTORY" ]; then
echo "Directory '$DIRECTORY' is already existing"
else
mkdir -p "$DIRECTORY"
echo "Directory '$DIRECTORY' is created"
fi
