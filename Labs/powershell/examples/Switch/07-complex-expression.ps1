$var = 1..7
$limit = 4

switch ( $var ) {
  3 {
    "var is three"
    continue
    }
  { ($_ -gt $limit) } {
            "'$_' is more than my limit of $limit - I'm done"
            break
            }
  { ( $_ -is [int]) -and ( (get-date).dayofweek -eq $_ ) } {
                                                           "'$_' is today's day of the week"
                                                           }
  default {
          "I don't test if var is '$_'"
          }
}