

$a=1

for($i=1; $i -le 10 ;$i+=1){
			
 for($j=0; $j -lt $i; $j+=1)
 {

   Write-Host -NoNewline $a 
   $a+=1
 }

	Write-Host ""		
}
