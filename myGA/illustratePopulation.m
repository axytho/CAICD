function illustratePopulation(population,V,M,lb,ub,it)

if (V==2)

    for j = 1:size(population,1)
        x(j,1:V) = lb+(ub-lb).*population(j,1:V);
    end
    
    plot(x(:,1),x(:,2),'.','MarkerSize',25);
    title(['Search Space, Iteration ' num2str(it)])
    xlabel('x1');
    ylabel('x2');
    axis([lb(1) ub(1) lb(2) ub(2)]);
    
elseif (M==2)
    figure(1)
    clf;
    plot(population(:,V+1),population(:,V+2),'.','MarkerSize',25);
    title(['Objectives, Iteration ' num2str(it)])
    xlabel('O1');
    ylabel('O2');
end
