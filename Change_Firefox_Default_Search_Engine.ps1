
Param(
  [string]$SearchProvider="Google"
)

$disclaimer = "By modifying this file, I agree that I am doing so only within Firefox itself, using official, user-driven search engine selection processes, and in a way which does not circumvent user consent. I acknowledge that any attempt to change this file from outside of Firefox is a malicious act, and will be responded to accordingly."
$Pattern    = "{`"\[global\]`"\:{`"current`"\:`"(.*)`",`"hash`"\:`"(.*)`"}}"
$Encoding   = [System.Text.Encoding]::UTF8
$Hasher     = New-Object ([System.Security.Cryptography.SHA256]::Create())

Get-ChildItem -Path "$env:public\..\*\AppData\Roaming\Mozilla\Firefox\Profiles\*" | Where-Object { $_.PSIsContainer } | ForEach-Object {

    $result = [System.Convert]::ToBase64String($Hasher.ComputeHash($Encoding.GetBytes($_.Name + $SearchProvider + $disclaimer)))
    $File   = "$($_.FullName)\search-metadata.json"
    $Data   = "{`"[global]`":{`"current`":`"$SearchProvider`",`"hash`":`"$result`"}}"
    $SearchJsonMozlz4 = "$($_.FullName)\search.json.mozlz4"

    If (-Not (Test-Path $File)) {New-Item -Path $file -ItemType file}

    (Get-Content $File) | Foreach-Object {
        If ($_ | Select-String -Pattern $Pattern) { 
            $_ -replace $Pattern, $Data
        } else {
            $data 
        } 
    } | out-file $File -Encoding utf8
   
   If ((Get-Content $File) -eq $Null) {
        $Data | Out-file $File -Encoding utf8
    }
    If (Test-path $SearchJsonMozlz4) {Remove-Item $SearchJsonMozlz4 -Force}
}
