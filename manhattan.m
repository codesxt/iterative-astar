function dist = manhattan(state, goal)
	[x,y]=size(goal);
	diff_mat=zeros(x,y);
	for i=1:x
		for j=1:y
			if((i==x) && (j==y))
				break
			endif
			[u,v]=find(state==goal(i,j));
			diff_mat(i,j)=abs(i-u)+abs(j-v);
		end
	end
	cost = sum (sum (diff_mat));
endfunction