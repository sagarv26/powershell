
Import-Module ActiveDirectory

$ou = "OU=Servers,DC=Domain,DC=com"

$servers = Get-ADComputer -Filter * -SearchBase $ou | select-object -expandproperty name

Foreach ($server in $servers){

    $Data = Get-Service -ServiceName *IIS*,*TomCat*,*httpd* -ComputerName $server | select machinename,name | sort machinename | format-table -AutoSize 

    Write($Data) | Out-File .\WebServices.txt -Append

}
