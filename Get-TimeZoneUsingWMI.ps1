$PCs = Get-Content -path C:\listMac.txt


$AllObjects=@()
foreach($pc in $pcs)
{


try{

  $server=$pc   
  $time= Get-WmiObject -Class win32_timezone -ComputerName $server |select  caption
   
    
  $property = @{PC=$server;Time=$time;ErrorMessage='UpdatedSuccessfully'}

  }

  catch{

        $errormessage = $_.exception.message
        $property = @{PC=$server;Time='';ErrorMessage=$errormessage}
  }


$AllObjects += New-Object PSobject -Property $property
}

$AllObjects | export-csv c:\Out -NoTypeInformation
