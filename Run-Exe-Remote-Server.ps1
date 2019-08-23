$servers = Get-Content -path c:\servers.txt
$sourcefile = 'c:\test.exe'

#This section will install the software 
foreach ($server in $servers) 
{
    $destinationFolder = '\\$server\c$\Temp'

    #It will copy $sourcefile to the $destinationfolder. If the Folder does not exist it will create it.
    if (!(Test-Path -path $destinationFolder))
    {
        New-Item $destinationFolder -Type Directory
    }


    Copy-Item -Path $sourcefile -Destination $destinationFolder

    Invoke-Command -ComputerName $server -ScriptBlock {Start-Process 'c:\temp\test.exe'}
}
