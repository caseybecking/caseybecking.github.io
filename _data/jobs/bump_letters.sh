#!/bin/bash

declare -A rename_map

# First pass: Rename files, avoiding conflicts
for file in [a-zA-Z]_*.yaml; do
  first_char="${file:0:1}"
  rest="${file:1}"
  
  next_char=$(echo "$first_char" | tr 'a-yA-Y' 'b-zB-Z')

  new_name="${next_char}${rest}"

  # If new name exists, append a temporary suffix
  counter=1
  temp_name="$new_name"
  while [[ -e "$temp_name" ]]; do
    temp_name="${next_char}_${counter}${rest#*_}"
    ((counter++))
  done

  mv "$file" "$temp_name"
  rename_map["$temp_name"]="$new_name"
  echo "Renamed: $file -> $temp_name"
done

# Second pass: Rename temporary files back to proper names
for temp_name in "${!rename_map[@]}"; do
  final_name="${rename_map[$temp_name]}"
  
  if [[ "$temp_name" != "$final_name" ]]; then
    mv "$temp_name" "$final_name"
    echo "Final rename: $temp_name -> $final_name"
  fi
done
