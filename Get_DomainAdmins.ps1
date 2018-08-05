#Provide Output Path for Administrator group and Domains Admins
$OutForAdministrators="C:\output\Administrators.csv"
$OutForDomainAdmins = "C:\Output\Domainadmins.csv" 

#Domain Admins OU
$DomainOU=""

$GroupName = "Administrators"
$NameDA = "Domain Admins"

#Provide To and From Address
$ToUserList = @('')
$From = '' 



#Fetch Users and group from Administrators excepts Domain Admins
Function GetNestedGroupmember($group){

$groupUsers=Get-ADGroup -Identity $group -Properties * 
$mem=$groupUsers.Members

foreach($m in $mem){

$type=(Get-ADObject -Filter {DistinguishedName -eq $m}).objectclass

if($type -eq "user"){

get-aduser -Filter {DistinguishedName -eq $m} -Properties * | 
select SamAccountName, Description, Info, Enabled, PasswordLastSet, PasswordNeverExpires, PasswordExpired, DisplayName, Manager, EmployeeID, Comment, @{N='memberof';E={$_.memberof}}, LastLogonDate, DistinguishedName  |
export-csv –append $OutForAdministrators  -NoTypeInformation 

}

elseif($type -eq "group"){

if($m -contains $DomainOU){
   
GetDomainAdminsGroupmember($m)
   
}
else{

GetNestedGroupmember($m)

}
}
else{

#Excluding Computer Name

}
}
}

##Function to Fetch Domain Admins
Function GetDomainAdminsGroupmember($group){

$groupUsers=Get-ADGroup -Identity $group -Properties * 
$groupUsers.Members |
get-aduser -Properties * | 
select SamAccountName, Description, Info, Enabled, PasswordLastSet, PasswordNeverExpires, PasswordExpired, DisplayName, Manager, EmployeeID, Comment, @{N='memberof';E={$_.memberof}}, LastLogonDate, DistinguishedName  |
export-csv –append $OutForDomainAdmins -NoTypeInformation

SendMail -Attachments $OutForDomainAdmins -Name $NameDA

}


##Function to Send Mail
Function SendMail{

[CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True)]
        [String]$Attachments,
        [Parameter(Mandatory=$True)]
        [String]$Name
    )
	
	
$Timestamp  = [String]((Get-Date).ToShortDateString() -Replace '/','_')
$SMTPServer = 'smtp server'
$CommomEmailParams = @{To=$ToUserList;Attachments=$Attachments;SmtpServer=$SMTPServer}
$Subject = "User List for " +$Name
$Body  = @"
Hi All,



Message: Script completed Successfully. Please see attached User List for $Name.



Time: $([DateTime]::Now)


Thanks
"@

Send-MailMessage @CommomEmailParams -From $From -Subject $Subject -Body $Body

}


##Main Program Starts Here

GetNestedGroupmember($GroupName)
SendMail -Attachments $OutForAdministrators -Name $GroupName

