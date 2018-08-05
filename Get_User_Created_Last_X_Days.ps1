$now=[datetime]::now

#mention number of days to be added or subtracted from $now
#add plus or minus sign to go back or forward in time

$days = -30

$30daysBack = ($now).AddDays($days)
$outFilePath = 'C:\User-List.CSV'

get-aduser -Filter {whenCreated -ge $30daysBack} -Properties employeeid,whencreated | select distinguishedname,samaccountname,employeeid,whencreated | export-CSV $outFilePath -Append -NoTypeInformation
