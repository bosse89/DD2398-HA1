#A program for finding FFLs

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
	c=0;
	for(i=0 ; i<TFsize ; i++){
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
	#print "uinTFsize: " uinTFsize
	########################## Find FBLs #####################
	j=0;
	for(i=0; i < uinTFsize; i++){	#A-loop													
		A=uinTF[i]
		#print "picked A: " uinTF[i]
		for(v=0; inTF[j] == A; v++ ){										    
			#print "A-target added to B: "inTAR[j]
			B[v] = inTAR[j]
			j++
		}
		#print "created list of possible B in A->B->C->A"
		#Bsize=length(B); 
		Bsize = v;  										 																		
		#print "size B: " Bsize
		for(k=0; k <Bsize; k++){ 										#B-loop (A-target-loop)														
			if(A != B[k]){
				#print "picked B: " B[k]																										
				for(g=0; g < uTFsize; g++){ 										
					if(B[k] == uTF[g]){
						BIndex = TFindex[g];
						#print "Found start-index for B: "B[k] " at " inTFindex[g]
						break
					}
				}
				#print "B: " B[k] " == " TF[BIndex]																											
				for(z=BIndex; B[k] == TF[z]; z++){# C-loop (B-target-loop)							
					C=TAR[z]
					if(C != A && C != B[k]){
						#print "picked C: " inTAR[z]																																											
						#print "A: " A " -> (B: " B[k] " -> C: " C ")"
						for(g=0; g < uTFsize; g++){ 										
							if(A == uTF[g]){
								AIndex = TFindex[g];
								#print "Found start-index for B: "B[k] " at " inTFindex[g]
								break
							}
						}
						for(p=AIndex; A == TF[p]; p++){						#D-loop (A-target-loop)			
							#print "picked D: " TAR[p]
							D=TAR[p]												
							if(D == C && A != B[k] && A != C && A != D && B[k] != C && B[k] != D){						
								print "*A: " A " -> (B: " B[k] " -> C: " C ")"							
							}
						}
					}
				} 
			}  
		}   		    
	}
	
	
      
}
	
