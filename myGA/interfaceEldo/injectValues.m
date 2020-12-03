function injectValues(filename,x,analysis)

    V=size(x,2);
    unix(['cp ' 'interfaceEldo/' filename '/' analysis '_proto ' 'interfaceEldo/' filename '/' analysis ]);

    fid=fopen('interfaceEldo/tmpParam','w');
    for j=1:size(x,1)
       line='+ ';
        for k=1:V
            line=[line num2str(x(j,k)) ' ' ]; %#ok<AGROW>
        end
        line=[line char(10)]; %#ok<AGROW>
        fwrite(fid,line);
    end
    fclose(fid);
    
    unix( [ 'sed "/xxPARAMxx/ r interfaceEldo/tmpParam" -i interfaceEldo/' filename '/' analysis  ] );
    unix( [ 'sed "/xxPARAMxx/d" -i interfaceEldo/' filename '/' analysis ]);
    