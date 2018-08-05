$members = Import-csv 'C:\Users.csv'
$GroupName = 'Group Name'
$AllObjects = @()

Foreach ($M in $members) {
    $Property = $Null
    Try 
    {
        Add-ADGroupMember -Identity $Groupname -Members $M.samaccountname -ErrorAction Stop
        $Property = [ordered]@{GroupName=$GroupName;samaccountname=$M.samaccountname;Message='UserAddedSuccessfully'}
    }
    Catch
    {
        $Property = [ordered]@{GroupName=$GroupName;samaccountname=$M.samaccountname;Message=$_.exception.message}        
    }

    $AllObjects += New-Object PSObject -Property $Property
}

$AllObjects | Export-CSV -NoInformationType 'C:\User_Out.csv'
