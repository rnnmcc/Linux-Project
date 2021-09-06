#!/bin/bash

sed -i '/np.save/d' lorenz_x.py    # Removes savetxt lines already present if running repeatedly
echo "np.savetxt('./xf_n.txt', xf, delimiter=',')" >>lorenz_x.py   # Add line at the end to save xf into file
echo "np.savetxt('./time.txt', t, delimiter=',')" >>lorenz_x.py    # Add line at the end to save t into file

