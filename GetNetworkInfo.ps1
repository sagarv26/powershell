param ( 
    [array]$arrComputer="$env:computername" 
    ) 
     
    "`n" 
     
    Write-Host "Name|    NetworkCard        | IP          | SUBNET      | GateWay      | MacADD           | DNS "  -ForegroundColor Green  
 
foreach ( $Computer in $arrComputer ) {  
     
 
    $nwINFO = Get-WmiObject -ComputerName $Computer Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null } #| Select-Object DNSHostName,Description,IPAddress,IpSubnet,DefaultIPGateway,MACAddress,DNSServerSearchOrder | format-Table * -AutoSize  
    #| Select-Object DNSHostName,Description,IPAddress,IpSubnet,DefaultIPGateway,MACAddress,DNSServerSearchOrder 
    $nwServerName = $nwINFO.DNSHostName 
    $nwDescrip = $nwINFO.Description 
    $nwIPADDR = $nwINFO.IPAddress 
    $nwSUBNET = $nwINFO.IpSubnet 
    $nwGateWay = $nwINFO.DefaultIPGateway 
    $nwMacADD = $nwINFO.MACAddress 
    $nwDNS = $nwINFO.DNSServerSearchOrder 
    #        Server/CompName   |NetworkCard | IPAdress  |  SubnetMask|  Gateway    | MAC Address|   DNS | 
    Write-Host "$nwServerName | $nwDescrip | $nwIPADDR | $nwSUBNET | $nwGateWay | $nwMacADD | $nwDNS " | ft * 
 
