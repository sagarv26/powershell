[cmdletbinding()]
param(
  $ComputerName=$env:COMPUTERNAME,
  [parameter(Mandatory=$true)]
  $ProcessName
)
$Processes = Get-WmiObject -Class Win32_Process -ComputerName $ComputerName -Filter "name='$ProcessName'"
 
foreach ($process in $processes) {
  $Executablepath = $process.ExecutablePath
  $Commandline = $process.Commandline
  $processid = $process.handle
 
  Write-Host ""
  Write-Host "Process Name = $ProcessName"
  Write-Host "Process ID = $Processid"
  Write-Host "Executable Path = $Executablepath"
  Write-Host "Command Line = $Commandline"
  Write-Host ""
}
