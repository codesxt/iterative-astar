function open_list = expand_children(state, goal, closed_list, g, parent_id)
	open_list = struct();
	counter = 0;
	# Encuentra la coordenada del 0
	[i,j] = find(state == 0);
	[n, m] = size(state);
	# Revisa cada nodo posible
	if(j > 1)
		child = swap_left(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g, parent_id);
			counter=counter+1;
		endif
	endif
	if(j < n)
		child = swap_right(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g, parent_id);
			counter=counter+1;
		endif
	endif
	if(i > 1)
		child = swap_up(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g, parent_id);
			counter=counter+1;
		endif
	endif
	if(i < m)
		child = swap_down(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g, parent_id);
			counter=counter+1;
		endif
	endif
endfunction