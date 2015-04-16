function dist = hamming(state, goal)
	dist = sum(sum(~(state==goal)));
endfunction