$Server = ' '
$All_DCs  = Get-ADDomainController -Filter * -server $Server | select -ExpandProperty hostname
$OSInfo   = Get-Wmiobject -Class win32_operatingsystem -ComputerName $All_DCs | select PSComputerName,caption,version
$DiskInfo = Get-Wmiobject -Class win32_logicaldisk -Filter "DriveType=3 and DeviceID='C:'" -ComputerName $All_DCs | select PSComputerName,@{L='C_Drive_Available_Space';E={[math]::round(($_.Size / 1GB),2)}},@{L='C_Drive_FreeSpace';E={[math]::round(($_.Freespace / 1GB),2)}}


$All_DC_Objs = @()
ForEach ($DC in $All_DCs) {
    $eachDC_RAM = $Null ; $eachDC_CPUUsage = $Null ; $Property = $Null
    Try {
        $eachDC_RAM = Get-WmiObject CIM_PhysicalMemory -ComputerName $DC -ErrorAction stop |  Measure-Object -Property capacity -sum | % {[math]::round(($_.sum / 1GB),2)}
        $eachDC_CPUUsage = (Get-Counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 10 -MaxSamples 10 -ComputerName $DC -ErrorAction stop | select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average
        $eachDC_CPUUsage = [Math]::round($eachDC_CPUUsage,2)
        
        $Property = @{'RAM_in_GB' = $eachDC_RAM; 'CPUUsage_In_Percent' = $eachDC_CPUUsage; 'PSComputerName' = $DC}
        $DC_Obj = New-Object PSObject -Property $Property -ErrorAction Stop
        $All_DC_Objs += $DC_Obj
    } catch {
        $Property = @{'RAM_in_GB' = 'Error Capturing this details'; 'CPUUsage_In_Percent' = 'Error Capturing this details'; 'PSComputerName' = $DC}
        $DC_Obj = New-Object PSObject -Property $Property
        $All_DC_Objs += $DC_Obj
    }
}

$OSInfo | select PSComputerName,caption,version | export-csv '' -NoTypeInformation
$DiskInfo | select PSComputerName,C_Drive_Available_Space,C_Drive_FreeSpace | export-csv '' -NoTypeInformation
$All_DC_Objs | select PSComputerName,RAM_in_GB,CPUUsage_In_Percent | export-csv '' -NoTypeInformation

