function plot_rfactors(scene_name, data, options)

f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;
%range = options.range;
%safe_range = min(range): min(max(range), length(data.abs_conv) ); 

fh = figure();
clf;
plot(cell2mat(data.rfactors(1)));
hold on
for frame = 2:numel(data.rfactors) 
  plot(cell2mat(data.rfactors(frame)));
end
grid on
title_txt = ['r-Factors from ', num2str(numel(data.rfactors)), ' runs of ', scene_name];
title(title_txt, 'FontSize', f_size, 'FontName',f_type );
xlabel('Solver iteration', 'FontSize', f_size, 'FontName', f_type); 
ylabel('Value', 'FontSize', f_size, 'FontName', f_type);
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_rFactors'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off


end