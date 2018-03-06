function write_latex_tabel(names, labels, data, caption)
    N = length(names);
    K = length(labels);    
    % \multicolumn{8}{c}{Coverage (\%)}
    disp(' ')       
    disp(' ')       
    disp('\begin{table}')    
    disp(['\caption{' caption  '}'])
    disp('\centering')        
    disp('{\tiny')
    begin_tabular_line = ['\begin{tabular}{l|'];
    for k=1:K,
        begin_tabular_line = [begin_tabular_line   'd{2.1}'];
        if k < K
            begin_tabular_line = [begin_tabular_line ' | '];
        else
            begin_tabular_line = [begin_tabular_line ' }'];
        end
    end
    disp(begin_tabular_line)        
    header_line = ['Name & '];
    for k=1:K,
        %header_line = [header_line   '\rotatebox{90}{\parbox{1.25cm}{' cell2mat(labels(k)) '}}'];
        %header_line = [header_line   '\rotatebox[origin=c]{90}{' cell2mat(labels(k)) '}'];
        header_line = [header_line   '\rotatebox{90}{' cell2mat(labels(k)) '}'];
        if k < K
            header_line = [header_line ' & '];
        else
            header_line = [header_line ' \\'];
        end
    end
    disp(header_line)
    disp('\hline')
    
    for n=1:N,    
        output = [names{n} ' & '];
        for k=1:K,
            value = data{n}(k);
            text = '-';
            if value~=0
                text = num2str(value);
            end            
            if k < K
                output = [output text ' & ' ];
            else
                output = [output text ' \\' ];                
            end
        end
        disp( output )    
    end
    disp('\end{tabular}')
    disp('}')       
    disp('\label{tab:xxx}')
    disp('\end{table}')
    disp(' ')       
    disp(' ')       
end



