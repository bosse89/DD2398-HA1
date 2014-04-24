BEGIN {
	FS=";"
	#print "#output nodes"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	TF[i++] = $1
	TAR[i++] = $2
 	oTF[j] = $1
	oTAR[j] = $2
  j++
}
END {
asort(TAR)
asort(TF)
#make lists of target and tf unique
 for ( i in TAR){
		if (TAR[i] != TAR[i-1]){
		   uTAR[j++]=TAR[i]
   }
  } 
   for ( i in TF){
		if (TF[i] != TF[i-1]){
		uTF[j++]=TF[i]
  }
  } 
  #for each Target, check if it is also a TF, if not then the target is an output node
  found=0
	for ( i in uTAR){
		for ( k in uTF){       
        if (uTF[k] == uTAR[i]) {
            found = 1
            break            
        }
  }
  if (found != 1){
     OUTN[f++] = uTAR[i]     
  }
      found=0   
  }
  #For each output node find all its conncections to TFs, this tf is and output link
  for ( i in OUTN){
		for ( k in oTAR){       
        if (oTAR[k] == OUTN[i]) {
              OUTL[l++]= TF[k] " -> " oTAR[k]
           }
  }
  }
  asort(OUTL)
   for ( i in OUTL){
		if (OUTL[i] != OUTL[i-1]){
		print OUTL[i]
  }
  } 
  
}
