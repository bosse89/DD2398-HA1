#A program for finding Auto-regulatory Motifs

BEGIN {
  FS=";"
  #print "FFLs"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )) {

    #Read everything
	TF[i++] = $1
	TAR[k++] = $2
}


END {	
    ############### make list of unique TF ###############      
	TFsize=length(TF)	        
    m=0;
	for (i=0; i < TFsize; i++){	    
		if(TF[i] != TF[i-1]){
			#print TF[i] " " i        
			uTF[m] = TF[i];
			TFindex[m] = i;
			m++               
		}      
	}
	#asort(uTF)
	################find internal links#############	
	uTFsize=length(uTF)
	c=0; s=0
	for(i=0 ; i<TFsize ; i++){
		j=1;
		for(j=0 ; j<uTFsize ; j++){
			if (TAR[i]==uTF[j]){
				#print TF[i] " > " TAR[i]
				inTF[c]=TF[i]
				inTAR[c]=TAR[i]
				if(TF[i]==TAR[i]){
					print "Auto-regulatory motif:" TF[i] " -> " TAR[i]
					s++
				}				
				c++
			}
		}
	}
    
    print "Number of Auto-regulatory motifs: " s
	
      
}
	
