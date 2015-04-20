clear; clc;
initial_state = random_puzzle();

goal = [1,2,3;4,5,6;7,8,0];

% Modo mediocre
% initial_state = [3, 1; 0, 2];
% goal = [1,2;3,0];

max_iters = 1000;

tiempo = 0;
pasos = 0;

for k = 1:1000
	open_list = struct();
	closed_list = struct();
	# Se añade el elemento nodo inicial a la lista cerrada
	open_list(1) = makechild(initial_state, initial_state, goal, 0, 0);
	
	found = false;
	iters = 0;
	
	tic();
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
				open_list(length(open_list)+1) = new_children(i);		
			endif
		endfor
		% Eliminar nodo expandido de la lista abierta
		open_list(id) = [];
		
		%printf("Iteración: %d\n", iters);
		iters++;
		if(iters > max_iters)
			break;
		endif
	endwhile
	t2 = toc();
	
	if(found)
		last_node_id = length(closed_list);
		%print_path(closed_list(last_node_id), closed_list)	
		%printf("El puzle fue solucionado.\n");
	else
		%printf("No se encontró una solución para el puzle en %d iteraciones.\n", (iters-1));
	endif
	%printf("Tiempo de ejecución: %f segundos\n", t2);
	tiempo += t2;
	pasos += iters;
	k
endfor
printf("%f %f", tiempo/1000, pasos/1000);