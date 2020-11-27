
% Show a graph of the second function in the benchmark

figure(30)
n = 5;
prec = 0.05;
[X,Y] = meshgrid(-n:prec:n,-n:prec:n);
for j = 1:size(X,1)
    for k = 1:size(X,2)
        Z(j,k) = benchmark(2,[X(j,k) Y(j,k)]);
    end
end 
surf(X,Y,Z)
