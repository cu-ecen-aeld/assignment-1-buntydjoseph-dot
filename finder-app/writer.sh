#!/bin/sh

# writer.sh
# Usage: writer.sh <writefile> <writestr>

writefile="$1"
writestr="$2"

# Check arguments
if [ $# -ne 2 ]; then
  echo "Error: Missing arguments. Usage: $0 <writefile> <writestr>"
  exit 1
fi

# Create directory path if needed
writedir=$(dirname "$writefile")
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
  echo "Error: Could not create directory path: $writedir"
  exit 1
fi

# Write string to file (overwrite)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: Could not create file: $writefile"
  exit 1
fi

exit 0
