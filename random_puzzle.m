function state = random_puzzle()
    state=reshape(randperm(9)-1,[3,3]);
endfunction
