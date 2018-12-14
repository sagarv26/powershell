$InputPath = 'C:\Users.CSV'
$Users = @(Import-csv $InputPath)
$Allobjects = @()

Foreach ($U in $Users) {
    Try {
        $mail = $Null
        $mail = $U.mail
        $ADUser = $Null
        $ADUser = Get-ADUser -Filter {mail -eq $mail} -Properties mail,employeeid -ErrorAction Stop

        $Property = $Null
        $Property = @{mail=$mail;employeeid=$ADUser.employeeid;Message='Successful'}

        $object = $Null
        $Object = New-Object PSObject -Property $property
    } Catch {
        $Property = $Null
        $Property = @{mail=$mail;employeeid='';Message=$_.exception.message}

        $object = $Null
        $Object = New-Object PSObject -Property $property
      }
    $Allobjects += $object
}

$Allobjects | Export-CSV -NoInformationType 'C:\Users_out.csv'
