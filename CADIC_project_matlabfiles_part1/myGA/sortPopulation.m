function [sorted, F] = sortPopulation(unsorted,V,M)

if (M==1) % Single Objective
	sorted = sortrows(unsorted, V+1);
	
else % Multi-objective case : non-domination sorting
    
    %% Ranking
    N = size(unsorted,1);
    sorted = zeros(N, V+M+1);
    vectorN = zeros(1,N);
    rank = ones(1,N);
    F = zeros(N,N);
    S = zeros(N, N);
    for p=1:N
        n = 0;
        for q=1:N % dominates means less than
            pDominatesq = all(unsorted(p, (V+1):(V+M)) <= unsorted(q, (V+1):(V+M))) && any(unsorted(p, (V+1):(V+M)) < unsorted(q, (V+1):(V+M)));
            qDominatesp = all(unsorted(p, (V+1):(V+M)) >= unsorted(q, (V+1):(V+M))) && any(unsorted(p, (V+1):(V+M)) > unsorted(q, (V+1):(V+M)));
            if pDominatesq
                S(p, q) =  1;
            elseif (qDominatesp)
                n = n + 1;
            end  
        end
        vectorN(p) = n;
        if n==0
            F(1, p) = 1;
        end     
    end
    %first part seems to work
    %QN = zeros(N, N); %N possible fronts
    for i = 1:N
         %while any(F(i,:))
         for p=1:N %for each element
             if F(i,p) % in F
                 for q=1:N
                     if S(p, q)
                        vectorN(q) = vectorN(q) - 1; % we've removed the front runner
                        if vectorN(q) ==0
                            rank(q) = i + 1;
                            F(i+1,q) = 1;
                        end
                     end
                 end
                 
             end   
         end
        
    end
    %sorted=F; %TODO: delte
    % front counter
    %frontCounter = 1;
    %I = zeros(1, N); % distances
    appendIndex = 1;
    %I(1) = intmax;%NOOOO!
    %I(N) = intmax;
    for i=1:N
        if any(F(i,:))
        thisFront = unsorted(boolean(F(i,:)),:);
        n = size(thisFront, 1);
        I = zeros(n, 1);
        
        for m = 1:M
            distance = sortrows([(1:n)',thisFront(:,V+m)] ,2); %sort rows and ensure indices are attached
            I(distance(1,1)) = intmax;
            I(distance(n,1)) = intmax;
            for k=2:(n-1)
                I(distance(k,1)) = I(distance(k,1)) + (distance(k+1,2) - distance(k-1,2))/(distance(n,2)-distance(1,2));
            end
        end
        distanceRank = [thisFront, I];
        sorted(appendIndex:(appendIndex+n - 1), :) = sortrows(distanceRank, (V+M+1), 'descend');
        appendIndex = appendIndex + n;
        end
    end
    %toBeSorted = [unsorted(:, 1:V), rank', I'];
    %sorted = sortrows(toBeSorted, [(V+1), -(V+2)]);
	


end
