raw =  1:10;
A = raw' * raw;
C = A;
A = 1./A;
X = [A, sum(A,2), 10*sum(C,2)];
Aextra = [A, ones(10, 2)];
D = [Aextra;X];
F = sortPopulation(D,10,2);
F(:,1:12)