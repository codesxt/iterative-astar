clear; clc;
initial_state = [7,2,4;5,0,6;8,3,1];
% initial_state = random_puzzle();
% initial_state = [1,2,3;4,5,0;7,8,6];
goal = [1,2,3;4,5,6;7,8,0];

max_iter=150;
set(0,'RecursionLimit',max_iter)

open_list = struct();
closed_list = struct();
# Se añade el elemento nodo inicial a la lista cerrada
closed_list(1) = makechild(initial_state, initial_state, goal, 0);

if(hamming(closed_list(1).state, goal) ~= 0)
	# Expande el primer nodo
	new_children = expand_children(closed_list(1).state, goal, closed_list, closed_list(1).g);
	# Añade los nodos nuevos a la lista abierta
	for i = 1:length(new_children)
		open_list(i) = new_children(i);
	endfor
	found = false;
	niters = 0;
	while(~found)
		# Calcula la prioridad menor de la lista abierta
		min_p = min_priority(open_list);
		# Expande el nodo con prioridad menor de la lista abierta
		for i = 1:length(open_list)
			if(hamming(open_list(i).state, goal) == 0)
				found = true;
				disp(i)
				disp(open_list(i).state)
				break;
			endif
			if(open_list(i).priority == min_p)
				new_children = expand_children(open_list(i).state, goal, closed_list, open_list(i).g);
				# Añade los nodos nuevos a la lista abierta
				if nfields(new_children)!=0 
					for j = 1:length(new_children)
						open_list(length(open_list)+1) = new_children(j);
						new_children(j).state;
					endfor
				endif
				# Añade el nodo expandido a la lista cerrada
				closed_list(length(closed_list)+1) = open_list(j);
				# Elimina el nodo expandido de la lista abierta
				open_list(i) = [];
				break;
			endif
		endfor
		niters+=1;
		disp(niters);
	endwhile
else
	disp("Fin.");
endif

initial_state
open_list(:).state