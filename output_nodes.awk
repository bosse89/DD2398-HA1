BEGIN {
	FS=";"
	#print "#output nodes"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	OUT1[i++] = $1
	OUT[i++] = $2
}
END {
asort(OUT)
asort(OUT1)
 for ( i in OUT){
		if (OUT[i] != OUT[i-1]){
		OUTF[j++]=OUT[i]
    #print(OUTF[j])
   }
  } 
   for ( i in OUT1){
		if (OUT1[i] != OUT1[i-1]){
		OUTT[j++]=OUT1[i]
    #print(OUTF[j])
   }
  } 
	for ( i in OUTF){
		for ( k in OUTT){       
        if (OUTF[i] == OUTT[k]) {
            found = 1
            #print OUTF[i]
            break            
        }
        #   print OUTF[i]
  }
  if (found != 1){
     #OUTE[j++]=OUTF[i]
     print OUTF[i]
  }
      found=0   
  }
}
