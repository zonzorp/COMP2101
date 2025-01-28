$logmessages = gc /var/log/syslog | 
	select-string -Pattern '^(\w+ \d+ \d\d:\d\d:\d\d) ([a-zA-Z0-9.]+) ([a-zA-Z0-9.-_]+): (.*)' |
	% {$_.Matches |
		% {new-object psobject -property @{
							Date=[datetime]("2022 " + $_.Groups[1].Value)
							Source=$_.Groups[2].Value
							Process=$_.Groups[3].Value
							Message=$_.Groups[4].Value
						  }
		  }
	  }
$logmessages | % {
			$nextlog =$_
			if (!$prevlog) {
				$delay = 0
			} else {
				$delay = $nextlog.date.subtract($prevlog.date)
			}
			if (!$maxdelay -or $delay -gt $maxdelay) {
				$maxdelay = $delay
				$maxdelaytimestamp = $nextlog.Date
				$prevmaxlog=$prevlog
				$nextmaxlog=$nextlog
			}
			if (!$mindelay -or $delay -lt $mindelay) {
				$mindelay = $delay
				$mindelaytimestamp = $nextlog.Date
				$prevminlog=$prevlog
				$nextminlog=$nextlog
			}
			$prevlog = $nextlog
		}
"Maximum delay was $maxdelay at $maxdelaytimestamp"
$prevmaxlog | fl Date, Source, Process, Message
$nextmaxlog | fl Date, Source, Process, Message
"Minimum delay was $mindelay at $mindelaytimestamp"
$prevminlog | fl Date, Source, Process, Message
$nextminlog | fl Date, Source, Process, Message
