function write_subset_latex_tabel(filter, names, labels, data, caption, format)

    if nargin<6
        format = 'keep'
    end

    N = length(names);
    sub_labels = labels(filter);
    sub_data = cell(N);    
    for i=1:N,    
        sub_data{i} = data{i}(filter);
    end
    
    if strcmp(format, 'sort')
        [~, reordering] = sort(sub_data{1},'descend');
    end
        
    if strcmp(format, 'keep')
        reordering = 1:length(sub_data{1});
    end
    
    for i=1:N,        
        sub_data{i} = sub_data{i}(reordering);
    end
    sub_labels = sub_labels(reordering);
    
    write_latex_tabel(names, sub_labels, sub_data, caption)
end
