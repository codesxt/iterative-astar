clear; clc;
initial_state = random_puzzle();
%initial_state = [1,2,3;0,4,5;7,8,6];
printf("Iniciando puzle de 8 piezas con algoritmo IDA*\n");
goal = [1,2,3;4,5,6;7,8,0];

found = false;
max_iters = 1000;
iters = 0;
open_list = struct();
closed_list = struct();

open_list(1) = makechild(initial_state, initial_state, goal, 0, 0);
f_limit = open_list(1).f;

while ~found && iters < max_iters
	printf("Iteracion: %3d f_limit: %3d\n", iters, f_limit);
	i = 1;
	list_limit = length(open_list);
	while(i <= list_limit)
		if ((open_list(i).f <= f_limit) && (~found))
			% Se añade el nodo expandido a la lista cerrada
			if (nfields(closed_list(1)) == 0)
				closed_list(1) = open_list(i);
			else
				closed_list(length(closed_list)+1) = open_list(i);
			endif
			% Se expande el nodo
			%printf("Expanding node %d with f: %d\n", i, open_list(i).f);
			new_children = expand_children(open_list(i).state, goal, closed_list, open_list(i).g, length(closed_list));
			for j = 1:length(new_children)
				if(nfields(new_children(j))>0)
					if(hamming(new_children(j).state, goal) == 0)
						closed_list(length(closed_list)+1) = new_children(j);
						found = true;
						printf("Solución encontrada.\n");
						closed_list(length(closed_list));
						print_path(closed_list(length(closed_list)), closed_list)
						break;
					endif
					open_list(length(open_list)+1) = new_children(j);
				endif
			endfor
			% Se elimina el nodo de la lista abierta
			open_list(i) = [];
			i = i - 1;
			list_limit = list_limit - 1;
			if i == list_limit
				break;
			endif
		endif
		i++;
	endwhile
	if (~found)
		f_limit = min([open_list(:).f]);
	endif
	iters++;
endwhile

% lista_abierta <- nodo inicial
% limite_f = lista_abierta(1).f
% mientras no finalizar
% 	para i en 1...largo(lista_abierta)
%		si lista_abierta(i) == solución
%			finalizar
%		si no 
%			si lista_abierta(i).f <= limite_f
%				expandir(lista_abierta(i))
%				lista_cerrada(largo(lista_cerrada)) = lista_abierta(i)
%				lista_abierta(i) = null
% 	finpara
% 	si no finalizar
% 		limite_f = min(lista_abierta(:).f)