
#number of elements to generate in a series
$limit=20


$series=@(0..20)

#create first 2 series elements
$series[0]=0
$series[1]=1

for($i=2; $i -lt $limit; $i+=1){

$series[$i]=$series[$i-1]+$series[$i-2]

}

#print the Fibonacci series numbers
$series -join " "
