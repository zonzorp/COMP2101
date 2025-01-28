Do {
  $annoyed = Read-Host -Prompt "Are you annoyed yet[y/N]?"
} While ( $annoyed -notlike "y*" )

"Sorry about that, friend." | out-host