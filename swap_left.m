function child = swap_left(state)
	child = state;
	[i,j] = find(state==0);
	temp = state(i,j-1);
	child(i,j) = temp;
	child(i,j-1) = 0;
endfunction