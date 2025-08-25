#!/bin/bash

USERNAME=$1
USERNAME_LIST_FILE="./users.txt"

# Check if a username was provided as an argument
if [ -z "$USERNAME" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# The 'if grep' command directly checks the exit status of grep.
# -q flag suppresses grep's output, so we only rely on the exit status.
if grep -q "$USERNAME" "$USERNAME_LIST_FILE"; then
    echo ""$USERNAME" found in the user list"
else
    echo ""$USERNAME" not found"
fi