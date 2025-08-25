#!/bin/bash
FILENAME="first_script.sh"
if [ -f "$FILENAME" ]; then
echo "File '$FILENAME' was found"
else
echo "File '$FILENAME' was not found"
fi
