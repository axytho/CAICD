function children = geneticOperators(parents,f,N,NC,P,V,M,lb,ub, childSpread)
    childSpread= 0.6;
	children = zeros(NC,V);
    u = rand(1,V);
    beta = (2.*u).^(1/(childSpread+1)).*(u<=0.5) +(u>0.5).*(1./(2.*(1-u)).^(1/(childSpread+1)));
    
    delta = 1-(2.*rand(2,V)).^(1/(childSpread+1)).*(rand(2,V)<=0.5) -(rand(2,V)>0.5).*((2.*(1-rand(2,V))).^(1/(childSpread+1)));
	for child = (1:NC/2)
		if rand<P
            
            %children(child,:) = [parents(child,1:V/2), parents(mod(child+1, NC)+1, (V/2+1):V)];azergeézrghn%M

             child1 = parents(2*child-1, :).*(1-beta) + parents(2*child, :).*(1+beta);
             child2 = parents(2*child-1, :).*(1+beta) + parents(2*child, :).*(1-beta);  
             child1(child1<0) = 0;
             child1(child1>1) = 1;
             child2(child2<0) = 0;
             child2(child2>1) = 1;
             children(2*child-1, :) = child1;
             children(2*child, :) = child2;
             % Do recombination
		else
			% Do mutation
            % WRONG: child(4, :) = [0, 0] then set one of the 2 to a random
            % value
            %RIGHT: child(4, : )= a succefull parent like parent(4, :)
            % and THEN we randomize a value.
            
            child12 = parents((2*child-1):(2*child),1:V)+ delta;
            child12(child12<0) = 0;
            child12(child12>1) = 1; 
            children((2*child-1):(2*child), :) = child12;
		end
	end
	
	children = evaluatePopulation(children,f,NC,V,M,lb,ub);
end
