import numpy as np
import matplotlib.pyplot as plt
import sys

dist = list()
time = list()

#def moving_avg(x, N):
#    cumsum = np.cumsum(np.insert(x, 0, 0))
#    return (cumsum[N:] - cumsum[:-N]) / float(N)

fp = open(sys.argv[1])

while fp:
    line = fp.readline()
    if line:
        x, y = line.split()
        time.append(float(x))
        dist.append(float(y))
    else:
        break
N = 10
move_mean = np.convolve(dist, np.ones((N,))/N, mode = 'same')
plt.scatter(time, dist, s=2)
plt.hlines(6.525666667, time[0], time[-1], colors='k', linestyles='--', label="crystal structure")
plt.plot(time, move_mean, 'r', label="moving average over 10 ps")
plt.xlabel("time [ps]")
plt.ylabel("distance [Å]")
plt.title("distance along the short axis over time")
plt.legend(loc='best')
plt.show()

