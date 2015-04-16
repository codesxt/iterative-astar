function child = swap_down(state)
	child = state;
	[i,j] = find(state==0);
	temp = state(i+1,j);
	child(i,j) = temp;
	child(i+1,j) = 0;
endfunction