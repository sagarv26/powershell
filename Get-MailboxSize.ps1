$dir = read-host "Directory to save the CSV file" 
$server = read-host "Exchange Server Name" 
 
get-mailboxstatistics -server $server | where {$_.ObjectClass -eq "Mailbox"} |  
Select DisplayName,TotalItemSize,ItemCount,StorageLimitStatus |  
Sort-Object TotalItemSize -Desc | 
export-csv "$dir\mailbox_size.csv"
