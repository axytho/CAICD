function data=extractTran(filename)

    unix([ 'sed "/^$/d" -i interfaceEldo/' filename '/tranResult']);
    unix('rm -rf tmp');
    unix('mkdir tmp');
    unix(['awk -f interfaceEldo/extract interfaceEldo/' filename '/tranResult' ]);
    
    [~,nb]=unix('ls tmp | wc -l');
    nb=str2double(nb);
    data=cell(1,nb);
    for j=1:nb
        x=importdata( ['tmp/f' num2str(j)] );
        data{j}.time=x(:,1);
        data{j}.X=x(:,2);
    end
    unix('rm -rf tmp');
    
end
