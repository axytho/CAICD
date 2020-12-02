function [population,it] = myGA(f,V,M,lb,ub)
	% myGA(f,V,M,lb,ub)
	% f : function to minimize
	% V : Dimension of the search space.
	% M : Number of objectives.
	% lb = lower bound vector.
	% ub = upper bound vector. 

	%% DEFINITION OF THE PARAMETERS


	N = 20;    % Population size
	NP = 8;    % Size of the mating pool
	NC = 8;    % Number of children generated by generation
    % MUST BE EVEN
    assert(mod(NC,2) == 0)
	P = 0.5;     % probability of recombination
    spread = 0.6;
	verbose = true; % (true) plots each iteration
    frontStop = false;
    %% PARAMETER SWEEP
    parameterResult = [];
    previousIntegral = 0;
    %for spread = 0.1:0.1:1.5
    %NC = NP;
	%% GENETIC ALGORITHM
    tic
	% Generation of the intial population
	population = initPopulation(N,V);

	population = evaluatePopulation(population,f,N,V,M,lb,ub);

	population = sortPopulation(population,V,M, NP);
    
    integrals = zeros(1, M-1);
    previousIntegrals = zeros(1, M-1);

	% Main loop
	it = 1;
    specialIt = 1;
	runFlag = true;
	while runFlag
        
		parents = selectionTournament(population,NP,V,M);	
        %size(parents)

		offspring = geneticOperators(parents,f,N,NC,P,V,M,lb,ub, spread);
        
		population = [ population(:,1:V+M) ; offspring(:,1:V+M) ];



		[population, sameFront] = sortPopulation(population,V,M, NP);
        %population(:,1:(V+M))


		population = cropPopulation(population,N);

		% Visualization
		if verbose
			illustratePopulation(population,V,M,lb,ub,it);
			drawnow;
			pause(0.001);
        end
        if (frontStop) || (M==1)
            it = it+1;
            if sameFront
                specialIt = specialIt + 1;
            else
                specialIt = 0;
            end
		runFlag = stopCriterion(specialIt);
        else
           for collapse=2:M
               integrals(collapse-1) = trapz(population(1:NP, V+1), population(1:NP, V+collapse));
           end
           abs(previousIntegrals - integrals)
           if any(abs(previousIntegrals - integrals) > 0.01)
                specialIt = specialIt + 1;
            else
                specialIt = 0;
           end
		   runFlag = stopCriterion(specialIt);
           previousIntegrals = integrals;
        end
    end
    
    %parameterResult = [parameterResult, toc]
    %end
	%plot(1:length(parameterResult), parameterResult);
end
