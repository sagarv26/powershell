
[cmdletbinding()]
param(
    $ComputerName=$env:COMPUTERNAME,
    [parameter(Mandatory=$true)]
    $ProcessName
)
$Processes = Get-WmiObject -Class Win32_Process -ComputerName $ComputerName -Filter "name='$ProcessName'"
if($Processes) {
    foreach ($process in $processes) {
    $processid = $process.handle
    $processcreationtime = $Process.Converttodatetime($Process.creationdate)
    write-host "`nThe $ProcessName `($processid`) process creation time is $processcreationtime"
}
} else {
    write-host "`nNo Process found with name $ProcessName"
}
write-host ""

