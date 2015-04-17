function child = makechild(childstate, parentstate, goalstate, g, parent_id)
	child = struct();
	child.state = childstate;
	% child.g = g + hamming(childstate, parentstate);
	child.g = g + 1;
	child.h = manhattan(childstate, goalstate);
	child.f = child.g + child.h;
	child.parent_id = parent_id;
endfunction