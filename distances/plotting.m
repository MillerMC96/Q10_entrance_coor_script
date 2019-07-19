coor_file1 = fopen("dist_vs_time.txt");
coor_file2 = fopen("dist_vs_time_inside.txt");
coor_file3 = fopen("long_axis_entrance.txt");
coor_file4 = fopen("long_axis_inside.txt");
size_dist = [2 Inf];
%% short axis
distance = fscanf(coor_file1, '%d %f', size_dist);
temp = fscanf(coor_file2, '%d %f', size_dist);
frames = length(temp(1, :));
for i = 1:frames
    temp(1, i) = temp(1, i) + frames;
end
distance = [distance, temp];

move_mean = movmean(distance(2, :), 10);

figure
hold
title('Distance between ALA63 and PHE28 over time')
ylabel('Distance [Å]')
xlabel('Time [ps]')
plot(distance(1, :), distance(2, :), 'b.')
plot(distance(1, :), move_mean, 'r-', 'LineWidth', 2)
legend('distance', 'moving average over 10 ps')
%% long axis
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
title('Distance between ALA243 and ALA29 over time')
ylabel('Distance [Å]')
xlabel('Time [ps]')
plot(distance(1, :), distance(2, :), 'b.')
plot(distance(1, :), move_mean, 'r-', 'LineWidth', 2)
legend('distance', 'moving average over 10 ps')