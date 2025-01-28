# This script demontrates using
#   Get-CIMInstance to retrieve management information objects
#   Format-Table to display objects in a table
#                to create custom properties with a property name specified and expression to generate property data
#   Using 'if' to test a specific bit in a byte
#   Using 'switch' to produce english strings describing which value out of an enumeration is in an int

Get-CIMInstance -class cim_printer |                       # get a collection of printer objects for the configured printers

    format-table name,                                     # use the name from the printer object without modification

                 @{                                        # create a custom property named 'Default?' to indicate if this is the default system printer, using hash notation
                     n="Default?";                         # the name of our custom property is 'Default?'
                     e={                                   # we are specifying that we will use a script expression to generate a value for our custom property
                         if ( $_.attributes -band 4 ) {    # the printer object property 'attributes' is a bitfield with the 3rd least significant bit (0000 0100) indicating if this printer is the default printer
                             $attrAsString="default"       # set the variable attrAsString to an english word to display as the value of our custom property if the 'default' bit was set to 1
                         } else {                          # otherwise
                             $attrAsString=""              # set the variable attrAsString to nothing if the 'default' bit is not set to 1 - note this isn't really necessary but I included it for clarity
                         }                                 # done testing the 'default' bit from the printer object's attributes property
                         $attrAsString                     # output attrAsString in our script expression, which will assign it to our custom 'Default?' property
                     }                                     # done with the expression to generate a value for our custom property
                 },                                        # done specifying a custom property

                 @{                                        # create a custom property named 'Shared?' to indicate if this printer is shared, using hash notation
                     n="Shared?";
                     e={
                         if ( $_.attributes -band 8 ) {
                             $attrAsString="shared"
                         }
                         $attrAsString
                     }
                 },

                 @{                                        # create a custom property named 'Satus' to display an english description of the current status of the printer, using hash notation
                     n="Status";
                     e={
                         switch($_.printerstatus){         # use a switch on the value of the 'printerstatus' property, which an enumerated set of integer values indicating the current status of the printer
                             1 {                           # A value of '1' is valid and means the printer status is 'other'
                                 $statAsString="other"     # put an english status description into the temporary 'statAsString' variable
                               }                           # done with this possible value for 'printerstatus'
                             2 {$statAsString="unknown"}   # do the same for all other valid values of 'printerstatus'
                             3 {$statAsString="idle"}
                             4 {$statAsString="printing"}
                             5 {$statAsString="warming up"}
                             6 {$statAsString="stopped printing"}
                             7 {$statAsString="offline"}
                             default {$statAsString="BAD STATUS"}
                         }                                 # done converting 'printerstatus' integer value into an english description
                         $statAsString                     # output statAsString in our script expression, which will assign it to our custom 'Status' property
                      }
                 } -autosize                               # done specifying properties to include in formatted table, use autosize paramter so format-table doesn't mess up display
