#!/bin/bash

n=$1
factorial=1
j=1

while [[ $j -le $n ]]
do
    factorial=$(( $j * $factorial ))
    j=$(( $j + 1 ))
done

echo "Factorial $n = $factorial"