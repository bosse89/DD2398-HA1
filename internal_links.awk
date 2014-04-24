BEGIN {
	FS=";"
	print "#internal links"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	TF[i] = $1
	TAR[i] = $2
  i++
}
END {
	#make list of unique TF
 asort(TF)
	for ( i in TF){
	    if(TF[i] != TF[i-1]){
         uTF[k++] = TF[i];
		  }
  }

  #For each target check if its also a TF, if so it means its an internal link
  for (k in uTF){
  for (i in TAR){
      if (TAR[i] == uTF[k]){ 
         OUT[j++]= TF[i] " -> " TAR[i]
      }
  }
  }
  #check for duplicates, and print
  #asort(OUT)
  for ( i in OUT ){
    if ( OUT[i] != OUT[i-1] ){
      print OUT[i]    
      }
  }
}
