$AllObjects=@()
Get-ADUser -Filter * -SearchBase "" | ForEach { 
try{
$UpdatedUPN = $_.SamAccountName + "@something.com" 
Set-ADUser $_.samAccountName -UserPrincipalName $UpdatedUPN 



$property = @{samAccount=$_.samAccountName;UPN=$UpdatedUPN;ErrorMessage='UpdatedSuccessfully'}

}

catch{
        $errormessage = $_.exception.message
        $property = @{samAccount=$_.samAccountName;UPN=$UpdatedUPN;ErrorMessage=$errormessage}
     }

      $AllObjects += New-Object PSobject -Property $property
}

$AllObjects | export-csv c:\Output.csv -NoTypeInformation
