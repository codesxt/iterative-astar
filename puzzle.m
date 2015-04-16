% clear; clc;
initial_state = [4,2,8;7,5,3;1,6,0];
% initial_state = random_puzzle();
% initial_state = [1,2,3;4,5,0;7,8,6];
goal = [1,2,3;4,5,6;7,8,0];

max_iter=150;
set(0,'RecursionLimit',max_iter)

open_list = struct();
closed_list = struct();
# Se añade el elemento nodo inicial a la lista cerrada
open_list(1) = makechild(initial_state, initial_state, goal, 0);

found = false;
iters = 0;
while ((length(open_list) > 0) && ~found)
	[min_f, id] = min_priority(open_list);
	new_children = expand_children(open_list(id).state, goal, closed_list, open_list(id).g);
	for i = 1:length(new_children)
		%//  if successor is the goal, stop the search
		if(nfields(new_children(i)) > 0)
			if(hamming(new_children(i).state, goal) == 0)
				found = true;
				break;
			endif
			%//        if a node with the same position as successor is in the OPEN list
			%//            which has a lower f than successor, skip this successor
			for j=1:length(open_list)
				if(hamming(open_list(j).state, new_children(i).state) && (new_children(i).f > open_list(j).f))
					break;
				endif
			endfor
			%//        if a node with the same position as successor is in the CLOSED list 
			%//            which has a lower f than successor, skip this successor
			if(nfields(closed_list) > 0) % Si la lista cerrada está inicializada
				for j=1:length(closed_list)
					if(hamming(closed_list(j).state, new_children(i).state) && (new_children(i).f > open_list(j).f))
						break;
					endif
				endfor
			endif
			%//        otherwise, add the node to the open list
			open_list(length(open_list)+1) = new_children(i);		
		endif
	endfor
	% Copiar nodo expandido a la lista cerrada
	if(nfields(closed_list) == 0)
		closed_list(1) = open_list(id);
	else
		closed_list(length(closed_list)+1) = open_list(id);
	endif
	% Eliminar nodo expandido de la lista abierta
	open_list(id) = [];
	
	iters++;
	printf("Iteraciones: %d\nLista abierta: %d\nLista cerrada: %d\nMin f: %d\nProfundideishons: %d\n", iters, length(open_list), length(closed_list), min_f, open_list(id).g)
endwhile