function plot_energy(scene_name, data, options)

f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;
range = options.range;

safe_range = min(range): min(max(range), length(data.Ekin) ); 

Ekin = data.Ekin(safe_range);
Epot = data.Epot(safe_range);
Emech = Ekin + Epot;

fh = figure();
clf;
h0 = plot(Ekin);
hold on
h1 = plot(Epot);
h2 = plot(Emech);
handles = [h0, h1, h2];
labels = {'Kinetic', 'Potential', 'Mechanical'};
grid on
legend(handles, labels,...
     'Location', 'NorthEast',...
     'FontSize', f_size,...
     'FontName', f_type...
     );
title_txt = ['Energy analysis of ', scene_name];
title(title_txt, 'FontSize', f_size, 'FontName',f_type );
xlabel('Solver iteration', 'FontSize', f_size, 'FontName', f_type); 
ylabel('Energy [J]', 'FontSize', f_size, 'FontName', f_type);
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, scene_name, '_energy'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off


end