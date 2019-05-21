#!/bin/bash


curl http://localhost:80/ && echo "Tests passed." || ( echo "Tests failed." && exit 1 )

#if [[ "${?}" -eq 0]]
#then
#	echo "Tests passed."
#else
#	echo "Tests failed."
#	exit 1
#fi
