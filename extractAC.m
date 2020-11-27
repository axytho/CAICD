function data=extractAC(filename)

    unix([ 'sed "/^$/d" -i interfaceEldo/' filename '/acResult']);
    unix('rm -rf tmp');
    unix('mkdir tmp');
    unix(['awk -f interfaceEldo/extract interfaceEldo/' filename '/acResult' ]);
    
    [~,nb]=unix('ls tmp | wc -l');
    nb=str2double(nb);
    data=cell(1,nb);
    for j=1:nb
        x=importdata( ['tmp/f' num2str(j)] );
        data{j}.f=x(:,1);
        data{j}.RX=x(:,2);
        data{j}.IX=x(:,3);
    end
    unix('rm -rf tmp');
    
end
