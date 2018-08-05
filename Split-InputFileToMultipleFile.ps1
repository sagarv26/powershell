$in_path = 'C:\Input\List.csv'
$allGrps = import-csv $in_path
$allCnt = $allGrps.count

$i= 0;$k = 0; $incby = 1000

for($i = 0;$i -lt $allCnt; $i += $incby) {
    
    $out_Path = 'C:\Input\List-' + $i + '-To-' + $($i+$incby) + '.csv'
    
    For ($j = $i;$j -lt $($i+$incby);$j++) {
        $allGrps[$j] | export-csv $out_Path -NoTypeInformation -Append
    }
}
