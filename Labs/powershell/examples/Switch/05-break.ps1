$var = 1..7
$othervar = 5

switch ( $var ) {
  3 {
    "var is three"
    continue
    }
  $othervar {
            "var matches othervar - I'm done"
            break
            }
  default {
          "I don't test if var is '$_'"
          }
}
