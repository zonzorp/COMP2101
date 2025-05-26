$var = 1..7
$limit = 4

switch ( $var ) {
  3 {
    "var is three"
    continue
    }
  {($_ -gt $limit)} {
            "'$_' is more than my limit of $limit - I'm done"
            break
            }
  default {
          "I don't test if var is '$_'"
          }
}

