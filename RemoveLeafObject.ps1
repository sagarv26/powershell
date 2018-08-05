

# Get all users using a provided Sheet.
$users = Get-Content C:\TermID.txt

# Loop through the users
foreach($user in $users)
{
    # Find all AD objects one level below the user
    $objs = Get-ADObject -Filter * -SearchScope `
    oneLevel -SearchBase $user.DistinguishedName
    
    # Performance a recursive delete to remove those leaf objects
    if($objs)
    {
        Write-Host "Removing leaf objects..."        
        $objs | Remove-ADObject -Recursive
    } 
}

#second:
Get-ADObject -SearchBase " " -filter * | Remove-ADObject -Recursive
