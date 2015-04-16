function val = visited(state, closed_list)
val = false;
	if(nfields(closed_list)>0)
		for i=1:length(closed_list)
			if(hamming(state, closed_list(i).state) == 0)
				val = true;
				break;
			endif
		endfor
	endif
endfunction