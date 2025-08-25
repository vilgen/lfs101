#!/bin/bash

echo "Please enter a string value!"
read VALUE

if [ "$VALUE" == "EMIN" ]; then
    echo "'$VALUE' equals to EMIN"
else 
    echo "'$VALUE' doesn't equals to EMIN"
fi