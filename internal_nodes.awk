BEGIN {
	FS=";"
	print "#internal nodes"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	OUT[i++] = $1
	#OUT[i++] = $2
}
END {
	#asort(OUT)
	for ( i in OUT)
		if (OUT[i] != OUT[i-1])
		print OUT[i]
}
