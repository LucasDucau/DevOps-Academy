#!/bin/bash

curl http://10.210.8.147:5002/ 

if [[ "${?}" -eq 0 ]] 
then
	echo "Success"
else
	echo "Failure"
	exit 1
fi
