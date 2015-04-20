arr = 1:1:10;

limit = length(arr);
for i = 1:limit
	printf("1 (%d,%d)   ", i, arr(i));
	if i == 5
		arr(i) = [];
		arr(length(arr)+1) = 4;
		limit=limit-1;
		i--;
	endif	
	if i > 0
		
	endif
	printf("2 (%d,%d)\n", i, arr(i));
	if i == limit
		break;
	endif
endfor

printf("\n");
arr = 1:1:10;
limit = length(arr);
i = 1;
while i < limit
	printf("1 (%d,%d)   ", i, arr(i));
	if i == 5
		arr(i) = [];
		arr(length(arr)+1) = 4;
		arr(length(arr)+1) = 5;
		limit=limit-1;
	endif
	
	i++;		
	printf("2 (%d,%d)\n", i, arr(i));
endwhile
length(arr);