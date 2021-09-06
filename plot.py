import numpy as np
import matplotlib.pyplot as plt

xf_1 = np.loadtxt('./xf_1.txt')
xf_2 = np.loadtxt('./xf_2.txt')
xf_3 = np.loadtxt('./xf_3.txt')
time = np.loadtxt('./time.txt')


x_1 = []
for line in xf_1:
    x_1.append(float(line))

x_2 = []
for line in xf_2:
    x_2.append(float(line))

x_3 = []
for line in xf_3:
    x_3.append(float(line))

t = []
for line in time:
    t.append(float(line))


plt.plot(t,x_1,label='-0.1')
plt.plot(t,x_2,label='0.0')
plt.plot(t,x_3,label='0.1')
plt.xlabel('time')
plt.ylabel('xf')
plt.title('Ronan\'s plot')
plt.legend(loc='upper left')

plt.savefig('./plot_lorenz.png')


