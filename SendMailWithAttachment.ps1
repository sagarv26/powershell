
#Provide the Path, From and To address, Subject for the mail
Param (
	[string]$Path = "c:\output\output\",
	[string]$SMTPServer = "",
	[string]$From = " ",
	[string]$To = " ",
	[string]$Subject = "Report",
    [string]$Date=(get-date).ToShortDateString() -replace('/','_')
	)


$SMTPMessage = @{
    To = $To
    From = $From
	Subject = "$Subject on $Date"
    Smtpserver = $SMTPServer
}

#Change current directory to file path
cd $Path

#Get required file for attachment
$File = Get-ChildItem $Path | Where { ($_.LastWriteTime -ge [datetime]::Now.AddDays(-2) ) }

if($file){

$SMTPBody="Hi,`n`nPFA,`n`nThanks,`nSagar V Hande`n`n"
Send-MailMessage @SMTPMessage -Body $SMTPBody -Attachments $file

}
