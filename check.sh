#!/bin/bash 
output=$(go-licenses check . 2>&1 | grep -E -v "contains non-Go code that can't be inspected for further dependencies:$|.*\.s$")
if [ -z "$output" ]; then
    echo "License Check Success"
    exit 0
else
    echo "$output"
    echo "License Check Failed"
    exit 1
fi
