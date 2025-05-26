#!/bin/bash
# this script display animals and their colours using a wordlist for loop

# VARIABLES
###########
colours=("red" "green" "blue" "yellow")
numberOfColours=${#colours[@]}
declare -A animals
animals=(["red"]="cardinal" ["green"]="frog" ["blue"]="lobster" ["yellow"]="duckiraffe")

# MAIN
######
echo "We have $numberOfColours colours"
# iterate over the colours array
for colour in ${colours[*]}; do
# display the colour and corresponding animal
  echo "====="
  echo "we have a $colour ${animals[$colour]}"
  echo "====="
done
