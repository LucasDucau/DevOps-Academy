#!/bin/bash

curl http://192.168.0.32:5002/

if [[ "${?}" -eq 0 ]]
then
	echo "Success"
else
	echo "Failure"
	exit 1
fi
