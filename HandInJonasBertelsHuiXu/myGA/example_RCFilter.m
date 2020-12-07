clear;

addpath('interfaceEldo'); % Add folder to path so it can be executed
eldo_setup; % Setup the eldo licence

% Lower and upper bounds of resistor and capacitor values
lb = [ 1e3 1e-9];
ub = [ 10e3 5e-9];

% Example values to evalues the simple RC filter circuit with
x = rand(10,2);
for j=1:10
    x(j,:) = lb+(ub-lb).*x(j,:);
end

interfaceEldo('circuit1',x);

%res = myGA(@(x) interfaceEldo(x,'circuit1'),2,3,lb,ub);
