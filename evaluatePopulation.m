function evalpopulation = evaluatePopulation(population,f,N,V,M,lb,ub)
	% Take only the variables from old population and append to
	% evalpopulation, while appending evalueted values at the end
	objectives = zeros(N,M);
	
	% Calculate objectives here
    
	
	evalpopulation = [population,f(lb+(ub-lb).*population)];
end
