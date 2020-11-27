function f_out = benchmark(nb,x)
% Benchmark functions
% nb : number of the function (see below).
% x : vector of variables.

[N,V] = size(x);
f = zeros(N,1+(nb>2));

switch nb
	case 1
		% Function x^2 in R^2
		f(:)=sum(x.^2,2);

	case 2 % Variation on x^2 in R^2
		N = size(x,1);
		f = zeros(N,1);
		for i=1:N
			if sum((x(i,:)-[2 2]).^2,2) < 0.5
				f(i) = -1+4*sum((x(i,:)-[2 2]).^2,2);
			elseif sum((x(i,:)-[-1 3]).^2,2) < 0.25  
				f(i) = -3+20*sum((x(i,:)-[-1 3]).^2,2);
			else
				f(i) = sum(x(i,:).^2,2);
			end
		end
		
	case 3 % ZDT4
	    f(:,1) = x(:,1);
		g = (1+10*(V-1))*ones(N,1);
		for i = 2:V
		    g = g + (x(:,i)).^2-10*cos(4*pi*x(:,i));
		end
		f(:,2) = g.*(1-sqrt(x(:,1)./g));
        
    case 4 % ZDT6
        g = 1 + 9 * (sum(x(:,2:V),2)/(V-1)).^0.25;
        f(:,1) = 1 - exp(-4*x(:,1)).*sin(6*pi*x(:,1)).^6;
        f(:,2) =  (1 - (f(:,1)./g).^2);
end

	f_out = f;
end
