# sample script to parse syslog entries
# reads in standard syslog files which may have different line formats
# copyright Dennis Simpson 2022
function get-syslog-messages ([string]$path, [string]$logtype) {
	switch ($logtype) {
		cisco {
			# YYYY-MM-DD HH:MM:SS syslogpriority sourceip message
			gc $path |
				select-string -Pattern '^([^ ]+ \d\d:\d\d:\d\d) ([a-zA-Z0-9.]+) ([a-zA-Z0-9.-_]+) (.*)' |
        			% {$_.Matches |
                			% {new-object psobject -property @{ Date=[datetime]($_.Groups[1].Value)
                                                        		    Priority=$_.Groups[2].Value
                                                        		    Source=$_.Groups[3].Value
                                                        		    Message=$_.Groups[4].Value
                                                  			}
                  			}
          			}
			}
		default {
			#this is ubuntu style
			# MMM DD HH:MM:SS hostidentifier processidentifier message
			gc $path |
				select-string -Pattern '^(\w+ \d+ \d\d:\d\d:\d\d) ([a-zA-Z0-9.]+) ([a-zA-Z0-9.-_]+): (.*)' |
        			% {$_.Matches |
                			% {new-object psobject -property @{ Date=[datetime]("2022 " + $_.Groups[1].Value)
                                                        		    Source=$_.Groups[2].Value
                                                        		    Process=$_.Groups[3].Value
                                                        		    Message=$_.Groups[4].Value
                                                  			}
                  			}
          			}
			}
	}	
}

# finds max delay
# if max delay occurs more than once, only the first max delay found is displayed
get-syslog-messages -path "/var/log/syslog" |
	% { $nextlog =$_
	if (!$prevlog) {
		$delay = 0
	} else {
		$delay = $nextlog.date.subtract($prevlog.date)
	}
	if (!$maxdelay -or $delay -gt $maxdelay) {
		$maxdelay = $delay
		$prevmaxlog=$prevlog
		$nextmaxlog=$nextlog
	}
	$prevlog = $nextlog
}

"Maximum delay was $maxdelay first seen between these entries:"
$prevmaxlog | fl Date, Source, Priority, Process, Message
$nextmaxlog | fl Date, Source, Priority, Process, Message
