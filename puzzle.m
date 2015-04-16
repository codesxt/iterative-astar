% clear; clc;
% initial_state = [4,2,8;7,5,3;1,6,0];
% initial_state = random_puzzle();
% initial_state = [1,2,3;4,5,0;7,8,6];
% initial_state = [1,2,0;4,5,3;7,8,6];
initial_state = [0,4,3;6,8,5;2,7,1];
goal = [1,2,3;4,5,6;7,8,0];

% Modo mediocre
% initial_state = [3, 1; 0, 2];
% goal = [1,2;3,0];

max_iter=150;
set(0,'RecursionLimit',max_iter)

open_list = struct();
closed_list = struct();
# Se añade el elemento nodo inicial a la lista cerrada
open_list(1) = makechild(initial_state, initial_state, goal, 0, 0);

found = false;
iters = 0;
while ((length(open_list) > 0) && ~found)
	[min_f, id] = min_priority(open_list);	
	% Copiar nodo a expandir a la lista cerrada
	if(nfields(closed_list) == 0)
		closed_list(1) = open_list(id);
	else
		closed_list(length(closed_list)+1) = open_list(id);
	endif
	% Expande el nodo
	new_children = expand_children(open_list(id).state, goal, closed_list, open_list(id).g, length(closed_list));
	for i = 1:length(new_children)
		if(nfields(new_children(i)) > 0)
			%Si el sucesor es el objetivo, detener
			if(hamming(new_children(i).state, goal) == 0)
				closed_list(length(closed_list)+1) = new_children(i);
				found = true;
				break;
			endif
			% Si un nodo con el mismo estado que este hijo y menor f está en la lista abierta, ignorar este nodo
			for j=1:length(open_list)
				if(hamming(open_list(j).state, new_children(i).state) && (new_children(i).f > open_list(j).f))
					break;
				endif
			endfor
			% Si un nodo con el mismo estado que este hijo y menor f esta en la lista abierta, ignorar este nodo
			for j=1:length(closed_list)
				if(hamming(closed_list(j).state, new_children(i).state) && (new_children(i).f > open_list(j).f))
					break;
				endif
			endfor
			%//        otherwise, add the node to the open list
			open_list(length(open_list)+1) = new_children(i);		
		endif
	endfor
	% Eliminar nodo expandido de la lista abierta
	open_list(id) = [];
	
	iters++;
	printf("Iteraciones: %d\n", iters);
	%printf("Lista abierta: %d\n", length(open_list));
	%printf("Lista cerrada: %d\n", length(closed_list));
	%if(length(open_list) > 0 && (nfields(open_list(1)) > 0))
	%	printf("Profundidad: %d\n", open_list(id).g);
	%endif
endwhile

% Imprime el camino pa' trás
last_node_id = length(closed_list);
print_path(closed_list(last_node_id), closed_list)