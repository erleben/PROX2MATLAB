function plot_rfactors_quartiles(scene_name, data, options)

f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;
%range = options.range;
%safe_range = min(range): min(max(range), length(data.abs_conv) ); 


K = numel(data.rfactors);
iterations = zeros(K,1);
for k = 1:K 
    iterations(k) = length(cell2mat(data.rfactors(k)));
end

max_iteration = max(iterations);
max_conv = zeros(max_iteration, 1);
min_conv = zeros(max_iteration, 1); 
mean_conv = zeros(max_iteration, 1); 
median_conv = zeros(max_iteration, 1); 

lower_median_conv = zeros(max_iteration, 1); 
upper_median_conv = zeros(max_iteration, 1); 

for i = 1:max_iteration
    values = [];
    
    for k = 1:K
        conv = cell2mat(data.rfactors(k));
        if i <= length(conv)
            val = conv(i);
            values = [values, val];
        end
    end
    values = sort(values);
    
    V = length(values);
    if rem(V,2) == 0
        lower_indices = 1:floor(V/2);
        upper_indices = floor(V/2)+1:V;
    else
        lower_indices = 1:floor(V/2);
        upper_indices = floor(V/2)+2:V;
    end      
    max_conv(i) = max(values);
    min_conv(i) = min(values);
    mean_conv(i) = mean(values);
    median_conv(i) = median(values);    
    lower_median_conv(i) = median(values(lower_indices));    
    upper_median_conv(i) = median(values(upper_indices));    
end

fh = figure();
clf;
h0 = plot(max_conv);
hold on
%h5= semilogy(mean_conv);
h1 = plot(upper_median_conv);
h2 = plot(median_conv);
h3 = plot(lower_median_conv);
h4 = plot(min_conv);
grid on
handles = [h0, h1, h2, h3, h4];
labels = {'Max', '3rd Quartile', 'Median', '1st Quartile', 'Min',};
legend(handles, labels,...
     'Location', 'NorthEast',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
title_txt = ['r-Factor behaviors of ', num2str(K), ' runs of ', scene_name];
title(title_txt, 'FontSize', f_size, 'FontName',f_type );
xlabel('Solver iteration', 'FontSize', f_size, 'FontName', f_type); 
ylabel('Value', 'FontSize', f_size, 'FontName', f_type);
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_rFactors_distribution'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off


end