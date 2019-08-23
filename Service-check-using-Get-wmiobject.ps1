
$Servers = Get-Content c:\utils\servers.txt
$Result = @()
ForEach ($Server in $Servers)
{ $Services = Get-WmiObject Win32_Service -ComputerName $Server }

$Services | ForEach {
If ($_)
{ $Result += New-Object PSObject -Property @{
'Computer Name' = $Server
'Service Display Name' = $_.Displayname
'Service Name' = $_.Name
'Start Mode' = $_.Startmode
'Start Name' = $_.Startname
State = $_.State
Status = $_.Status
'System Name' = $_.Systemname
}
}

Else
{ $Result += New-Object PSObject -Property @{
'Computer Name' = $Server
'Service Display Name' = $null
'Service Name' = $null
'Start Mode' = $null
'Start Name' = $null
State = $_.State
Status = "Could not connect to server"
'System Name' = $null
}
}

$Result | Export-Csv c:\utils\result.txt
