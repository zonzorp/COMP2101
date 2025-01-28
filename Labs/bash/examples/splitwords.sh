#/bin/bash
# this script plays around with the effects of parameter/variable expansion and word splitting

cat <<EOF
Storing the following into a variable:
line 1
line  2
line   3

EOF
myvar="line 1
line  2
line   3"
myvar_no_quotes=$myvar $myvar
myvar_used_quotes="$myvar $myvar"
numchars=$(echo $myvar | wc -c)
echo "Expanding the variable on the command without using quotes puts the following $numchars characters on the command line:"
echo $myvar
numchars=$(echo "$myvar" | wc -c)
echo "Expanding the variable on the command using quotes puts the following $numchars characters on the command line:"
echo "$myvar"
cat <<EOF
Expanding the variable using a HERE Document (input redirection):
----- original variable -----
$myvar
----- variable used in assignment without quotes -----
$myvar_no_quotes
----- variable used in assignment with quotes -----
$myvar_used_quotes
-------------------------
EOF
