function flag = stopCriterion(it)
% Return :  1 if the GA must continue 
%           0 if the GA must stop

    flag = 1;
    if it > 100 % Stop after 100 iterations
        flag = 0;
    end

end