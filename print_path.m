function print_path(node, closed_list)
	node.state
	while(node.parent_id > 0)
		node.state
		node = closed_list(node.parent_id);
	endwhile
	node.state
endfunction