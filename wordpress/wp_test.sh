#!/bin/bash


curl http://localhost:80/

if [[ "${?}" -eq 0]]
then
	echo "Tests passed."
else
	echo "Tests failed."
	exit 1
fi

