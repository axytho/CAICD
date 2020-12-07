function flag = stopCriterion(it)
% Return :  1 if the GA must continue 
%           0 if the GA must stop

    flag = 1;
    if it > 50 % Stop after 200 iterations
       flag = 0;
    end
    %population(1:NP,(V+1):(V+M))
    %flag = (sum(abs(diff(population(1:NP,(V+1):(V+M))))) > 1e-6);

end