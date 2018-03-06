function plot_all_contact_points(names, data, options )

f_type = options.font_type;
f_size = options.font_size;
pixel_width = options.pixel_width;
pixel_height = options.pixel_height;
paper_width_cm = options.paper_width;
paper_height_cm = options.paper_height;
path = options.path;
range = options.range;

N = length(data);

handles = [];
totals = [];
fh = figure();
clf
for i =1:N    
    safe_range = min(range): min(max(range), length(data{i}.contacts) ); 
    h = plot(data{i}.contacts(safe_range),'x');
    handles = [handles, h];
    totals = [totals, sum(data{i}.contacts(safe_range))];
    if i>=1
        hold on
    end
end
grid on
title('Contacts', 'FontSize', f_size, 'FontName', f_type )
[~, I] = sort(totals, 'descend');
legend(handles(I),...
     {names{I}},...
     'Location', 'NorthWest',...
     'FontSize', f_size,...
     'FontName', f_type...
     )
xlabel('Simulaiton Step (#)', 'FontSize', f_size, 'FontName', f_type )
ylabel('Count (#)', 'FontSize', f_size, 'FontName', f_type )
set(fh, 'Position', [100, 100, pixel_width, pixel_height]);
set(fh, 'PaperUnits', 'centimeters');
set(fh, 'PaperPosition', [0 0 paper_width_cm paper_height_cm]);
filename = [path, 'contacts'];
filename = filename(~isspace(filename));
print(gcf,'-depsc2', filename);
hold off

end



