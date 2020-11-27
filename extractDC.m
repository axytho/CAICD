function data=extractDC(filename)

    unix([ 'sed "1,2d" -i interfaceEldo/' filename '/dcResult']);
    tmp=importdata(['interfaceEldo/' filename '/dcResult']);
    data=tmp(:,2);
    
end