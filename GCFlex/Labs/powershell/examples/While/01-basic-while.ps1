[int]$startingNumber = Read-Host -Prompt "Enter a number to start a countdown from your number to 1"

$mycount = $startingNumber

While ( $mycount -gt 0 ) {
    "." * ($startingNumber - $mycount) + $mycount
    $mycount--
    sleep 1
}

" " * $startingNumber + "Done."