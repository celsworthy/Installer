#!/bin/bash

until curl http://localhost:8080/index.html > /dev/null 2>&1
do
#	echo "Root is dead"
	/bin/sleep 3
done
#echo "Root is alive"


