#!/bin/bash

if [[ ! $1 ]]
then
    echo "Usage: occurences.sh <access.log file>"
    exit 1
fi

file=$1

total_uniq_ip_addr_cnt=$(awk -F' ' '{ print $1 }' $file | sort -u | wc -l | tr -d ' ')
most_frequent_ip_line=$(awk -F' ' '{ print $1 }' $file | sort | uniq -c | sort -nr | head -1)
most_frequent_ip=$(echo $most_frequent_ip_line | awk '{ print $2 }')
most_frequent_ip_cnt=$(echo $most_frequent_ip_line | awk '{ print $1 }')


echo "Access Log Report"
echo "-------------------"
echo "Log file: $file"
echo "Total unique IP addresses: $total_uniq_ip_addr_cnt"
echo "Most frequent IP: $most_frequent_ip ($most_frequent_ip_cnt)"