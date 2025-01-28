[int]$startingNumber = Read-Host -Prompt "Enter a number to start a countdown from your number to 1"

for ( $mycount = $startingNumber; $mycount -gt 0; $mycount-- ) {
    "." * ($startingNumber - $mycount) + $mycount
    sleep 1
}

" " * $startingNumber + "Done."