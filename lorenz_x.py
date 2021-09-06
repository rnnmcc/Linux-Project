import numpy as np
sigma = 10.
b = 8./3
r = 28
x=-0.1
y=1.
z=0.
ni = 5000
dt = 0.005
xf = np.zeros(ni)
yf = np.zeros(ni)
zf = np.zeros(ni)
t = np.arange(ni)*dt
for i in range(ni):
    dx = sigma*(y-x)
    dy = (r*x) - y - (x*z)
    dz = (x*y) - (b*z)
    x = x + dt*dx
    xf[i] = x
    y = y + dt*dy
    yf[i] = y
    z = z + dt*dz
    zf[i] = z
np.savetxt('./xf_n.txt', xf, delimiter=',')
np.savetxt('./time.txt', t, delimiter=',')
