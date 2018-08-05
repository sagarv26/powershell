
Add-Type -Path "C:\Oracle\product\12.1.0\client_1\ODP.NET\managed\common\Oracle.ManagedDataAccess.dll"
$ds=$da=$null

$query = Get-Content C:\query1.txt

$username=" "
$password=" "
$datasource="(DESCRIPTION = (ADDRESS = (PROTOCOL = tcp)(HOST = prd2b-vip.albertsons.com)(PORT = 1551)) (CONNECT_DATA = (SERVICE_NAME = FIN1PRD2) (INSTANCE_NAME = FINPRD2B)))"
$connectionString = 'User Id=' + $username + ';Password=' + $password + ';Data Source=' + $datasource
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionString)
$connection.open()
Write-Host "Connected.."
$command=$connection.CreateCommand()
$command.CommandText=$query
$reader=$command.ExecuteReader()

$ds = New-Object system.Data.DataSet
$da = New-Object Oracle.ManagedDataAccess.Client.OracleDataAdapter($command)
#[void]$da.fill($ds)
#return $ds.Tables[0] | Export-CSV "C:\test.csv" -NoTypeInformation

$da.fill($ds) | Out-Null -ErrorAction SilentlyContinue
$data=$ds.Tables[0] | Export-CSV "C:\test.csv" -NoTypeInformation
$connection.Close()

#You will have all the data without being connected stored in the dataset  
Write-Host $ds.Tables[0].Rows.Count  

