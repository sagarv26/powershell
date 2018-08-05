
$path = ' '

$users = import-csv $path

ForEach ($user in $users) {
 
    $flag = $null
    $flag = get-aduser -Identity $user.name
 
    If ($flag -ne $null) {
        
        Write-host "Disabling User: $($user.Name)" -ForegroundColor Green
        set-aduser -Enabled:$False -Identity $user.Name -Confirm:$false

    } Else {
        
        Write-Host "User not found: $($user.Name)" -ForegroundColor Red
      
      }
    
    start-sleep -Seconds 4    
}
