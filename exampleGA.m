% Clear workspace and figures to prevent unwanted behavior
clear;
clf;

% Choose 1d benchmark function
%	Value : function
%		1 : paraboloid 
%		2 : paraboloid with different local and global minima 
%		3 : ZDT4 function
%		4 : ZDT6 function
bm = 4;


% Define boundaries and other paremeters
V = 2 + 4*(bm>2); % 2 for bm 1 and 2; 6 for ZDT functions
M = 1 + (bm>2); % 1 for bm 1 and 2; 2 for ZDT functions
lb = (-5+5*(bm>2))*ones(1,V); % -5 for bm 1 and 2; 0 for ZDT functions
ub = (5-4*(bm>2))*ones(1,V); % 5 for bm 1 and 2; 1 for ZDT functions

% Use your implementation of GA
population = myGA(@(x) benchmark(bm,x),V,M,lb,ub);

% Show local and global optima of benchmark 2
if (bm==2) % Change this to some other number to stop plotting!
	bm2_ShowFunction
elseif (bm>2)
	%Plot solution
	hold on
	plot((.28*(bm==4):0.01:1),(bm==4)*(1-(.28*(bm==4):0.01:1).^2)+(bm==3)*(1-sqrt((.28*(bm==4):0.01:1)))) % plot of ZDT functions
	hold off
end