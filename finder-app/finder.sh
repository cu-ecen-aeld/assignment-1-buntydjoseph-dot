#!/bin/sh

# finder.sh
# Usage: finder.sh <filesdir> <searchstr>

filesdir="$1"
searchstr="$2"

# Check arguments
if [ $# -ne 2 ]; then
  echo "Error: Missing arguments. Usage: $0 <filesdir> <searchstr>"
  exit 1
fi

# Check directory exists
if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' is not a directory"
  exit 1
fi

# Count files (all subdirectories)
num_files=$(find "$filesdir" -type f | wc -l)

# Count matching lines across all files
# (If no files exist, grep may error; handle by forcing 0.)
num_matching_lines=$(grep -R -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"
exit 0
