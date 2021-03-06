clear;

addpath('interfaceEldo'); % Add folder to path so it can be executed
eldo_setup; % Setup the eldo licence

% Lower and upper bounds of resistor and capacitor values
% W1 W2 W3 W4 W5 L1 L2 L3 L4 L5 VB VINDC 
lb = [ 350e-9 350e-9 350e-9 350e-9 350e-9 18e-8  18e-8 18e-8 18e-8 18e-8 0.1 0.1];         %0.5 0.5 0.5];
ub = [ 35e-6 35e-6  35e-6 35e-6  35e-6  18e-6 18e-6 18e-6 18e-6 18e-6 1.7 1.7];        %1 1 1];

% Example values to evalues the simple RC filter circuit with
%  x = rand(10,2);
% for j=1:10
%     x(j,:) = lb+(ub-lb).*x(j,:);
% end

% interfaceEldo('circuit2',x);

%                                           V,M 
res = myGA(@(x) interfaceEldo('circuit3',x),12,2,lb,ub);
