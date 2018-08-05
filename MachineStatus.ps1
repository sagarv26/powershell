#Below Script will test the connection of provided Servers and paste the ouput in CSV.
#If True server is Active and if false then Inactive


#Provide the Output in text format
$servers=Get-Content C:\machineList.txt


$AllObjects=@()
foreach ($Server in $Servers) 
{
  
  $test=Test-Connection -ComputerName $Server -Count 1 -Quiet
  
  
  $property = @{user=$server;Status=$test}



  $AllObjects += New-Object PSobject -Property $property
}

$AllObjects | export-csv C:\pingresult.csv -NoTypeInformation
