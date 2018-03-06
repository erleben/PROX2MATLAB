function plot_time_slice( scene_name, data, options, yrange )

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
safe_range = min(range): min(max(range), length(data.solver_time) ); 


totals = [sum(data.solver_time(safe_range)),...
    sum(data.collision_detection_time(safe_range)),...
    sum(data.preprocessing_time(safe_range)),...
    sum(data.broad_time(safe_range)),...
    sum(data.narrow_time(safe_range)),...
    sum(data.contact_reduction_time(safe_range))...
    ];
 [~, I] = sort(totals, 'descend');

fh = figure();
clf;
h0 = semilogy(data.solver_time(safe_range),'+');
hold on
h1 = semilogy(data.collision_detection_time(safe_range),'x'); 
h2 = semilogy(data.preprocessing_time(safe_range),'o'); 
h3 = semilogy(data.broad_time(safe_range),'s'); 
h4 = semilogy(data.narrow_time(safe_range),'d'); 
h5 = semilogy(data.contact_reduction_time(safe_range),'^'); 
grid on
set(gca,'YMinorGrid','Off');
if ~isempty(yrange)
   ylim(yrange); 
end
handles = [h0, h1, h2, h3, h4, h5];
labels = {'Solver',...
     'Collision Detection',...
     'Preprocessing',...
     'Broad Phase',...
     'Narrow Phase',...
     'Contact Reduction'...
     };
legend(handles(I),...
     {labels{I}},...
     'Location', 'NorthWest', 'FontSize', f_size, 'FontName', f_type )
title_txt = ['Timing details of ', scene_name, ' test scene'];
title(title_txt, 'FontSize', f_size, 'FontName', f_type )
xlabel('Simulaiton Step (#)', 'FontSize', f_size, 'FontName', f_type )
ylabel('Time (ms)', 'FontSize', f_size, 'FontName', f_type )
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_time_slice'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off




end
