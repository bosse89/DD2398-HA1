#A program for finding FBLs

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
				c++
			}
		}
	}
    
    ########################indexation of internal links#############  	
    inTFsize=length(inTF);    
    m=0;
	for (i=0; i < inTFsize; i++){ #indexate internal link list
		if(inTF[i] != inTF[i-1]){
			#print inTF[i] " " i  " " m " "      
			uinTF[m] = inTF[i];
			inTFindex[m] = i; 
			m++        
		}      
	}
	uinTFsize=length(uinTF)
	########################## Find FBLs #####################
	j=0;
	for(i=0; i < uinTFsize; i++){															#A-loop											
		A=uinTF[i]
		#print "picked A: " uinTF[i]
		while (inTF[j] == A ){										     
			B[v++] = inTAR[j]
			j++
		}
		#print "created list of possible B subTAR in A->B->C->A"
		Bsize=length(B);   										  																	
		for(k=0; k <Bsize; k++){ 															#B-loop (A-target-loop)													
			if(A != B[k]){
				#print "picked B: " B[k]																									
				for(c=0; c < uinTFsize; c++){ 										
					if(B[k] == uinTF[c]){
						BIndex = inTFindex[c];
						#print "Found start-index for B: "B[k] " at " inTFindex[c]
						break
					}
				}																											
					for(z=BIndex; B[k] == inTF[z]; z++){									# C-loop (B-target-loop)							
						#print "picked C: " inTAR[z]																					
						C=inTAR[z]
						if(C != A && C != B[k]){
							for(s=0; s < uinTFsize; s++){ 																
								if(C == uinTF[c]){
									cTARIndex = inTFindex[s];		
									#print "Found start-index for C: "inTAR[z] " at " inTFindex[c]					
									break
								}										
							}												
							for(p = cTARIndex; inTF[p] == inTAR[z]; p++){						#D-loop (C-target-loop)			
								#print "picked D: " inTAR[p]
								D=inTAR[p]
								#print D " == " uinTF[i] " && " B[k] " != " inTAR[z] " && " uinTF[i] " !=" B[k] " && " uinTF[i]" != " inTAR[z]
								#print "A: " uinTF[i] " -> B: " B[k] " -> C: " inTAR[z] " Ctar: " inTAR[d]
								if(D == A && A != B[k] && A != C && B[k] != C && B[k] != D  && C != D){						
									print "A: " A " -> B: " B[k] " -> C: " C "-> D: " D									
								}
							}
						} 
					} 
			} 
		}   		    
	}
	
	#Of those found, there are loads of dublettes
	# put them in a list and sort the thre A B C, then put them in a big list with all
	# do unique on this big list
      
}
	
