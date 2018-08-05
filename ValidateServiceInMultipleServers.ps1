

Function CheckService(){
 [CmdletBinding()]
 param(
 [parameter(Mandatory=$true)]
 [Array]$name,
 [parameter(Mandatory=$true)]
 [String]$server
 )

 $RunningService=$null
 $stoppedService=$null

 foreach($n in $name){

 $status=Get-Service -DisplayName $n -ComputerName $server
 
 if($status.status -eq 'Running')
 {
 $RunningService+=$status.DisplayName + ", "
 }
 else{
 $stoppedService+=$status.DisplayName +", "
 }

 }

 if($RunningService.Count -eq 0){ 
 
 $RunningService = 'No Services'

 }
 if($stoppedService.Count -eq 0){

 $stoppedService = 'No Required Services'
 
 }

 return "Server - "+$server+ "`nRunning Service : " + $RunningService +"`nStopped Service : "+$stoppedService + "`n"

}

$servers=@('Server-1', 'Server-2', 'Server-3', 'Server-4', 'Server-5', 'Server-6')

$Server-1_data=$Server-2_data=$Server-3_data=$Server-4_data=$Server-5_data=$Server-5_data=$null


foreach($server in $servers){

if($server -eq 'Server-1' ){

$Server-1_data = CheckService -name @('CA ControlMinder Agent Manager',
'service 1',
'service 2') -server $server

}

if($server -eq 'Server-2' ){

$Server-2_data = CheckService -name @(
'service 1',
'service 2') -server $server

}

if($server -eq 'Server-3' ){

$Server-3_data = CheckService -name @(
'service 1',
'service 2') -server $server

}

if($server -eq 'Server-4' ){

$Server-4_data = CheckService -name @(
'service 1',
'service 2') -server $server


}

if($server -eq 'Server-5' ){

$Server-5_data = CheckService -name @(
'service 1',
'service 2'
) -server $server

}

if($server -eq 'Server-6' ){

$Server-7_data = CheckService -name @(
'service 1',
'service 2',

) -server $server

}

}


#Provide To and From Address
$ToUserList = @(' ')
$From = ' '
$Timestamp  = [String]((Get-Date).ToShortDateString() -Replace '/','-')
$SMTPServer = 'smtp.webmail.com'
$CommomEmailParams = @{To=$ToUserList;SmtpServer=$SMTPServer}
$Subject = "Daily task status - " +$Timestamp
$Body  = @"
Hi All,

Validation Completed

1. Services validated 

Thanks,


"@

Send-MailMessage @CommomEmailParams -From $From -Subject $Subject -Body $Body


