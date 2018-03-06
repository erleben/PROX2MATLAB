function histogram_exit_status(scene_names, data, caption, options, yrange)

if nargin < 5
    yrange = [];
end

f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;

range = options.range;
for i=1:length(data)
    range = min(range): min(max(range), length(data{i}.abs_conv) );
end

values = [];
for i=1:length(data)
    abs_conv = data{i}.abs_conv(range);
    rel_conv = data{i}.rel_conv(range);
    div      = data{i}.divergence(range);
    
    count_abs = sum( abs_conv>0);
    count_rel = sum( rel_conv>0);
    count_div = sum( div );
    non_conv = ((abs_conv>0) + (rel_conv>0)==0);
    count_non = sum(non_conv>0);
    
    values = [values; [count_abs, count_rel, count_non, count_div] ]; 
end

labels = {'Absolute Convergence',...
    'Relative Convergence',...
    'Non Convergence',...
    'Divergence',...
};

fh = figure();
clf;
bar(values,'stacked');
legend(...
     labels,...
     'Location', 'Best',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
 
set(gca,'XTickLabel',scene_names)
grid on

if ~isempty(yrange)
   ylim(yrange); 
end

title(caption, 'FontSize', f_size, 'FontName', f_type)
xlabel('Test Scenes', 'FontSize', f_size, 'FontName', f_type)
ylabel('Observations (#)', 'FontSize', f_size, 'FontName', f_type)
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, caption, 'bars_exit_status'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2',filename);

end