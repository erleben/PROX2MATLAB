function plot_convergence_quartiles(scene_name, data, options, yrange)

if nargin < 4
    yrange = [];
end


f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;


K = numel(data.convergence);
iterations = zeros(K,1);
for k = 1:K 
    iterations(k) = length(cell2mat(data.convergence(k)));
end

range = options.range;
max_iteration = min(max(range), max(iterations) );


max_conv = zeros(max_iteration, 1);
min_conv = zeros(max_iteration, 1); 
mean_conv = zeros(max_iteration, 1); 
median_conv = zeros(max_iteration, 1); 

lower_median_conv = zeros(max_iteration, 1); 
upper_median_conv = zeros(max_iteration, 1); 

for i = 1:max_iteration
    values = [];
    
    for k = 1:K
        conv = cell2mat(data.convergence(k));
        if i <= length(conv)
            val = conv(i);
            values = [values, val];
        end
    end
    values = sort(values);
    
    values = values(values>0);
    
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
h0 = semilogy(max_conv);
hold on
h1 = semilogy(upper_median_conv);
h2 = semilogy(median_conv);
h3 = semilogy(lower_median_conv);
h4 = semilogy(min_conv);
%h5= semilogy(mean_conv);
grid on
set(gca,'YMinorGrid','Off');
if ~isempty(yrange)
   ylim(yrange); 
end
handles = [h0, h1, h2, h3, h4];
labels = {'Max', '3rd Quartile', 'Median', '1st Quartile', 'Min',};
legend(handles, labels,...
     'Location', 'NorthEast',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
title_txt = ['Convergence rate behaviors of ', num2str(K), ' runs of ', scene_name];
title(title_txt, 'FontSize', f_size, 'FontName',f_type );
xlabel('Solver iteration', 'FontSize', f_size, 'FontName', f_type); 
ylabel('Merit function', 'FontSize', f_size, 'FontName', f_type);
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_convergence_distribution'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
print(gcf,'-dpdf', filename);
hold off



end