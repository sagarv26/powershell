

$limit=50
$even=@()
$odd=@()

for($i=1; $i -le $limit; $i+=1){

if($i%2 -eq 0){

$even+=$i

}

if($i%2 -ne 0){

$odd+=$i

}

}


Write-Host Even Numbers till 50 : `n
$even -join ' ';

Write-Host Odd Numbers till 50 : `n
$odd -join ' ';
