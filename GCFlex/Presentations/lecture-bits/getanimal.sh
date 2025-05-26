#!/bin/bash
# this script is to play with arrays

# variables
colours=("red" "green" "blue" "yellow")
declare -A animals
animals=(["red"]="cardinal" ["green"]="frog" ["blue"]="lobster" ["yellow"]="duckiraffe")

# Main
# the end of the array is the number of elements in the array - 1
endOfArray=$(( ${#colours} -1 ))
# the number of colours in the array is needed in the script
numberOfColours=${#colours}
read -p "Pick a number [1-$numberOfColours]: " num
num=$(( $num - 1 ))
# see if the number supplied by the user is valid for the colours array
# valid means between 0 and the end of the array
if [ $num -lt 0 ]; then
    echo "The smallest number you can pick is 1." >&2
    exit 2
elif [ $num -gt $endOfArray ]; then
    echo "The maximum number you can pick is $numberOfColours" >&2
    exit 2
fi

# display the colour and corresponding animal
colour=${colours[$num]}
echo "====="
echo "Index $num of the colours table produces a $colour ${animals[$colour]}"
echo "====="

# display the values only from the colours array
#for colour in "${colours[@]}"; do
#    echo "The colours array contains the value $colour"
#done

# display the keys and values from the colours array
#index=0
#for (( index=0; $index < ${#colours} ; index++ )); do
#    echo "The colours array has the value ${colours[$index]} at position $index"
#done

#  num=0 no longer hard-coded, ask the user for a number to use
#echo "The animals array contains ${animals[red]}, ${animals[blue]}, ${animals[green]}"
#echo "The array animals has the following values: ${animals[@]}"
