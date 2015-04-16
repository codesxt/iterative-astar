function child = makechild(childstate, parentstate, goalstate, g)
	child = struct();
	child.state = childstate;
	child.g = g + hamming(childstate, parentstate);
	child.h = manhattan(childstate, goalstate);
	child.f = child.g + child.h;
endfunction