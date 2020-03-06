coor_file1 = fopen("pulled_out2_short.txt");
coor_file2 = fopen("pulled_out3_short.txt");
coor_file3 = fopen("long_axis_entrance.txt");
coor_file4 = fopen("long_axis_inside.txt");
size_dist = [2 Inf];
%% short axis
default_dist = 6.525666667;%default distance in Angstroms
distance = fscanf(coor_file1, '%d %f', size_dist);
temp = fscanf(coor_file2, '%d %f', size_dist);
frames = length(distance(1, :));
for i = 1:30
    temp(1, i) = temp(1, i) + frames;
end
distance = [distance, temp];

move_mean = movmean(distance(2, :), 10);
figure
hold
title('Distance between ALA63 and PHE28 over time (short axis)')
ylabel('Distance [Å]')
xlabel('Time [ps]')
ylim([5, 13])
plot(distance(1, :), distance(2, :), 'b.')
plot(distance(1, :), move_mean, 'r-', 'LineWidth', 2)
line([0, 100],[default_dist, default_dist], 'Color', 'Black',...
    'LineStyle', '--')
legend('distance', 'moving average over 10 ps', 'crystal structure',...
     'Location','Southeast')
%% long axis
default_dist = 10.03220632; %long axis default distance in Angstroms
distance = fscanf(coor_file3, '%d %f', size_dist);
temp = fscanf(coor_file4, '%d %f', size_dist);
frames = length(temp(1, :));
for i = 1:frames
    temp(1, i) = temp(1, i) + frames;
end
distance = [distance, temp];

move_mean = movmean(distance(2, :), 10);
figure
hold
title('Distance between ALA242 and ALA29 over time (long axis)')
ylabel('Distance [Å]')
xlabel('Time [ps]')
ylim([9, 16])
plot(distance(1, :), distance(2, :), 'b.')
plot(distance(1, :), move_mean, 'r-', 'LineWidth', 2)
line([0, 600],[default_dist, default_dist], 'Color', 'Black',...
    'LineStyle', '--')
legend('distance', 'moving average over 10 ps', 'crystal structure',...
     'Location','Southeast')