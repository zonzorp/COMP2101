(1..10) |
    foreach {
        New-Object -TypeName psobject -Property @{
             NumberOfDigits=$_
             MaxValueWithBinary=[math]::Pow(2,$_)
             MaxValueWithOctal=[math]::Pow(8,$_)
             MaxValueWithHexadecimal=[math]::Pow(16,$_)  
        }
     } |
     Format-Table -AutoSize NumberOfDigits, MaxValueWithBinary, MaxValueWithOctal, MaxValueWithHexadecimal