coor_file1 = fopen("dist_vs_time.txt");
coor_file2 = fopen("dist_vs_time_inside.txt");
size_dist = [2 Inf];
distance = fscanf(coor_file1, '%d %f', size_dist);
temp = fscanf(coor_file2, '%d %f', size_dist);
frames = length(temp(1, :));
for i = 1:frames
    temp(1, i) = temp(1, i) + frames;
end
distance = [distance, temp];

move_mean = movmean(distance(2, :), 10);

hold

plot(distance(1, :), distance(2, :), 'b.')
plot(distance(1, :), move_mean, 'r-', 'LineWidth', 2)