#!/bin/bash
for i in $(echo $1 | tr "," "\n")
do
 echo $i" ansible_ssh_host="$i >> $2
done