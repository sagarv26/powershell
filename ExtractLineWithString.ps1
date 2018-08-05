$InputFilePath = ' '
$OutputFilePath = ' '
$Pattern = '.*ERROR : *Access is denied.*'
Select-String -Pattern $Pattern -Path $InputFilePath -SimpleMatch:$false | select -ExpandProperty line | Out-File -LiteralPath $OutputFilePath -Append