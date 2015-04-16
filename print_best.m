function print_best(list)
	min_p = min_priority(list);
	for i = 1:length(list)
		if(list(i).priority == min_p)
			disp(list(i))
			break;
		endif
	endfor
endfunction