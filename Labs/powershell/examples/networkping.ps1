# Example script to demonstrate using foreach to iterate over a set of numbers
# Creates a collection of integers from 1 to 254
#   Pipes them to a foreach loop that gets a ping status for each of them appended to a hardcoded network number
#   Pipes those status objects to a select-object which strips them down to simple objects for output
#   Pipes those simple objects to format-table for display

1..254 |
  ForEach -Process {WmiObject -Class Win32_PingStatus -Filter ("Address='192.168.16." + $_ + "'") -ComputerName .} |
  Select-Object -Property Address, StatusCode |
  ft -auto
