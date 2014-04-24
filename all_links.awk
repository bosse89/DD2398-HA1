BEGIN {
	FS=";"
	print "#all links"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	TF[i] = $1
	TAR[i] = $2
  i++
}
END {
	
	for ( i in TF){
		OUT[k++] = TF[i] " -> " TAR[i];
		
  }
  asort(OUT)
  for (i in OUT){
      if (OUT[i] != OUT[i-1]){ 
         print OUT[i]
      }
    }
}
