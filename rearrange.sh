#!/bin/bash

input_file="$1"
output_file="$2"

# Extract lines starting with "mas"
mas_lines=$(grep "^mas" "$input_file")

# Remove lines starting with "mas" from the input file
grep -v "^mas" "$input_file" > "$output_file"

# Prepend the "mas" lines to the output file
echo "$mas_lines" | cat - "$output_file" > temp && mv temp "$output_file"

