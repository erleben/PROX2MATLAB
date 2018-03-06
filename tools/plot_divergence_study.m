function plot_divergence_study(scene_names, data, caption, options, yrange)

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
    range = min(range): min(max(range), length(data{i}.divergence) );
end


styles = { 'x', '+', 'o', '^', '<', '>', 's', 'd'};

fh = figure();
clf;
handles = [];
for i=1:length(data)
    div = data{i}.divergence(range);
    y   = sort(div);
    x   = find(y>0);    
    choice = mod(i, length(styles))+1
    style = styles{choice  };    
    h   = plot(x,y(x),style);
    if i==1
        hold on
    end
    handles = [handles, h];
end
legend(...
      handles, scene_names,...
     'Location', 'Best',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
grid on
axis tight
if ~isempty(yrange)
   ylim(yrange); 
end
title(caption, 'FontSize', f_size, 'FontName', f_type)
xlabel('Solver run(#)', 'FontSize', f_size, 'FontName', f_type)
ylabel('Count (#)', 'FontSize', f_size, 'FontName', f_type)
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, caption, 'divergence_study'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2',filename);
hold off

end