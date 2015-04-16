function open_list = expand_children(state, goal, closed_list, g)
	open_list = struct();
	counter = 0;
	# Encuentra la coordenada del 0
	[i,j] = find(state == 0);
	# Revisa cada nodo posible
	if(j > 1)
		child = swap_left(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g);
			counter=counter+1;
		endif
	endif
	if(j < 3)
		child = swap_right(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g);
			counter=counter+1;
		endif
	endif
	if(i > 1)
		child = swap_up(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g);
			counter=counter+1;
		endif
	endif
	if(i < 3)
		child = swap_down(state);
		if(~visited(child, closed_list))
			open_list(counter+1) = makechild(child, state, goal, g);
			counter=counter+1;
		endif
	endif
		# Si el nodo no esta en la lista cerrada / ~visited(state, closed_list)
			# Añadir el nodo a la lista abierta
endfunction