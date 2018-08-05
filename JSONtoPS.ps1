#Converting JSON to Windows PowerShell objects and back

$json = @"

{

    "firstName": "Rahul",

    "lastName" : "Dravid",

    "age"      : 43,     "address"  :

    {

        "streetAddress": "21 2nd Street",

        "city"         : "Bengaluru",

        "state"        : "Karnataka",

        "postalCode"   : "10021"

     },      "phoneNumber":

     [

         {

            "type"  : "home",

            "number": "212 555-1234"

         },

         {

            "type"  : "fax",

            "number": "646 555-4567"

         }

     ]

 }

"@


$PowerShellRepresentation = $json | ConvertFrom-Json

$PowerShellRepresentation

$PowerShellRepresentation | ConvertTo-Json
