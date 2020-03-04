import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sys

dist = list()
time = list()

fp = open(sys.argv[1])

#read file
while fp:
    line = fp.readline()
    if line:
        x, y = line.split()
        time.append(float(x))
        dist.append(float(y))
    else:
        break

#window
N = 10

#moving mean
move_mean = np.convolve(dist, np.ones((N,))/N, mode = 'same')

#moving standard deviation
dist_pd = pd.Series(dist)
move_std = dist_pd.rolling(N).std()

plt.scatter(time, dist, s=2)
plt.hlines(6.525666667, time[0], time[-1], colors='k', linestyles='--', label="crystal structure")

#plotting moving mean
plt.plot(time, move_mean, 'r', label="moving average over 10 ps")

#plotting moving std
plt.plot(time, move_std, 'r', label="moving standard deviation")
#TODO: add std to original data and plot it

plt.xlabel("time [ps]")
plt.ylabel("distance [Å]")
plt.title("distance along the short axis over time")
plt.legend(loc='best')
plt.show()

