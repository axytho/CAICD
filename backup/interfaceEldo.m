function obj = interfaceEldo(foldername,x)
	%% 	'foldername' 	name of the folder containing the following files you will simulate.
	%		If you simulate dc, 'dc_proto' is expected (the same for ac (ac_proto) and tran (tran_proto))
	%% 	'x' 			contains the different sets of parameter values of circuit instances that are simulated.
	
	%% IMPORTANT: This block of code works as-is.
	% It is advised that you only keep the simulations you need and comment the ones you don't.
	% Be aware that changing anything inside this block (except commenting when you are sure it's not necessary), things might not work any more.
	
    % Perform DC simulation of 'foldername'
    injectValues(foldername,x,'dc');
    unix(['eldo interfaceEldo/' foldername '/dc']);% > /dev/null']);
    dataDC = extractDC(foldername);
    
    % Perform Transient simulation of 'foldername'
    injectValues(foldername,x,'tran');
    unix(['eldo interfaceEldo/' foldername '/tran ']);%> /dev/null']);
    dataTran = extractTran(foldername);
    
    % Perform AC simulation of 'foldername'
    injectValues(foldername,x,'ac');
    unix(['eldo interfaceEldo/' foldername '/ac ']);%> /dev/null']);
    dataAC = extractAC(foldername);
    
    %% Example plots of data, showing how it is extracted for different instances
    for j=1:size(x,1)
        plot(dataTran{j}.time,dataTran{j}.X);
        drawnow;
        pause;
    end
    
    for j=1:size(x,1)
        loglog(dataAC{j}.f, sum([dataAC{j}.RX dataAC{j}.IX].^2,2) );
        drawnow;
        pause;
    end
    
    %% Form your objectives here!
    % The objectives you need (at least) are Gain-Bandwidth and Power, more are optional
    obj = zeros(size(x,1),2); % Change second dimension when adding more objectives!
    %obj(:,1) = ;
    %obj(:,2) = ;
    %obj(:,3) = ;
    
end

