
$Group = "Administrators"
$Computer=" "


$GetGroupUser = Get-CimInstance -Class Win32_GroupUser -Filter "GroupComponent=""Win32_Group.Domain='$Computer',Name='$Group'""" -ComputerName $Computer

$GetGroupUserPartComponent = $GetGroupUser.PartComponent 

Foreach ($Member in $GetGroupUserPartComponent) 
  { 
    $MemberDomain = $Member.Domain 
    $MemberName = $Member.Name 
    Write-Host "$MemberDomain\$MemberName" 

  }
