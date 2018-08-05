$OP = 'C:\master.txt'

$Files = dir C:\Logs\* -Include *.txt -Recurse
Foreach ($f in $files){
    Get-Content $f.fullname | out-file $OP -Append -Encoding ascii
}

