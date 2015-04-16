function child = makechild(childstate, parent, goal, g)
	child = struct();
	child.state = childstate;
	child.g = g + hamming(childstate, parent);
	child.h = manhattan(childstate, goal);
	child.priority = child.g + child.h;
endfunction