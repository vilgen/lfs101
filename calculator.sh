#!/bin/bash

add(){
    echo $(($NUMBER1+$NUMBER2))
}

substract(){
    echo $(($NUMBER1-$NUMBER2))
}

multiply(){
    echo $(($NUMBER1*$NUMBER2))
} 

divide(){
    if [ "$NUMBER2" -eq 0 ]; then
        echo "A number cannot be divided by 0"
        exit 1
    fi
    echo $(($NUMBER1/$NUMBER2))
}

if [ "$#" -lt 3 ]; then
    echo "Usage: ./calculator.sh <arithmetic operation (a, s, m, d)> <number1> <number2>"
    exit 1
fi

OPERAND=$1
NUMBER1=$2
NUMBER2=$3

if [ "$OPERAND" == "a" ]; then
    add
elif [ "$OPERAND" == "s" ]; then
    substract
elif [ "$OPERAND" == "m" ]; then
    multiply
elif [ "$OPERAND" == "d" ]; then
    divide
else
    echo "Operand not supported"
fi


