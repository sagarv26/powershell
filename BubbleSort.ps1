
function bubble_sort($a){

$n=$a.Length

for($i=1; $i -le ($n-1); $i+=1)
{

    for($j=0; $j -le ($n-$i-1); $j+=1)
    {

        if($a[$j] -le $a[$j+1])
        {

            $temp=$a[$j]
    
            
            $a[$j]=$a[$j+1]
            

            $a[$j+1]=$temp

        }

    }

}
return $a

}


$a=@()

$a=@(10,50,40,20,70,60,30)

$sorted=bubble_sort $a

Write-Host Sorted Array:

foreach($s in $sorted){

$s

}



