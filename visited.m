function val = visited(state, closed_list)
val = false;
	for i=1:length(closed_list)
		if(hamming(state, closed_list(i).state) == 0)
			val = true;
			break;
		endif
	endfor
endfunction