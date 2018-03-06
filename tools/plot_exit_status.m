function plot_exit_status(scene_name, data, options, yrange)

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

range = options.range;

safe_range = min(range): min(max(range), length(data.abs_conv) ); 

abs_conv = data.abs_conv(safe_range);
rel_conv = data.rel_conv(safe_range);
div      = data.divergence(safe_range);

should_plot_abs_conv = max(abs_conv) > 0;
should_plot_rel_conv = max(rel_conv) > 0;

should_write_iteration = ~(should_plot_abs_conv | should_plot_rel_conv);

labels = {};
fh = figure();
clf;

y = sort(div);
x = find(y>0);    
h = plot(x,y(x),'x');
handles = h;
labels(end+1) = {'Divergence Detections'};

hold on

if should_plot_rel_conv
    y = sort(rel_conv);
    x = find(y>0);    
    h = plot(x,y(x),'o');
    handles = [handles, h];
    labels(end+1) = {'Relative Convergence'};
end

if should_plot_abs_conv
    y = sort(abs_conv);
    x = find(y>0);    
    h = plot(x,y(x),'^');
    handles = [handles, h];
    labels(end+1) = {'Absolute Convergence'};
end
grid on
axis tight

if ~isempty(yrange)
   yaxis(yrange); 
end

if should_write_iteration
    K = numel(data.convergence);
    iterations = zeros(K,1);
    for k = 1:K 
        iterations(k) = length(cell2mat(data.convergence(k)));
    end
    max_iter = max(iterations);        
    title_txt = ['Exit Status from ', scene_name, ' test scene using '  num2str(max_iter) ' solver iterations'];
else
    title_txt = ['Exit Status from ', scene_name, ' test scene'];
end

title(title_txt, 'FontSize', f_size, 'FontName', f_type );
legend(handles, labels,...
     'Location', 'NorthWest',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
xlabel('Solver run(#)', 'FontSize', f_size, 'FontName', f_type )
ylabel('Count (#)', 'FontSize', f_size, 'FontName', f_type )
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_exit_status'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off


end