function n = countValuesInFLimit(list, f_limit)
	n = sum([list(:).f] <= [f_limit * ones(1,length(list))])
endfunction