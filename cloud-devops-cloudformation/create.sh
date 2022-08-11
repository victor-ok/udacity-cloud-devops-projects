#!/bin/bash

argz1=$1
argz2=$2
argz3=$3

if [[ $# != 3 ]]; then
	echo "Error! Usage: create.sh stack-name <template-body>.yml <parameters>.json"
else 
	aws cloudformation create-stack --stack-name "$argz1" --template-body file://"$argz2" --parameters file://"$argz3" \
	--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"	
fi
