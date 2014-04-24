BEGIN {
	FS=";"
	print "#all nodes"
}

(($0 !~ /^$/) && ($0 !~ /^#/ )){
	#Read..
	OUT[i++] = $1
	OUT[i++] = $2
}
END {
	asorti(OUT)
	for ( i in OUT)
		if (OUT[i] != OUT[i-1])
		print OUT[i]
}
