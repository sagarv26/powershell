$users=Import-Csv C:\users.csv


$AllObjects=@()
foreach($user in $users){

    try{
    Remove-ADUser -Identity $user -Confirm:$false

    $property = @{user=$user;ErrorMessage='DeletedSuccessfully'}
    }

    catch{

        $errormessage = $_.exception.message
        $property = @{user=$user;ErrorMessage=$errormessage}
           }

    $AllObjects += New-Object PSobject -Property $property

}

$AllObjects | export-csv c:\Output.csv -NoTypeInformation
