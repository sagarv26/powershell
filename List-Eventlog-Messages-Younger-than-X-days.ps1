# Date calculation with .AddDays()
Clear-Host
$DateCut = (Get-Date).AddDays(-1)
Get-EventLog System -EntryType Error | 
Where-Object {$_.TimeWritten -ge $DateCut}
