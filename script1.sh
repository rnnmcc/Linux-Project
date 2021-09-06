#!/bin/bash

curl http://shakespeare.mit.edu/tempest/full.html > TheTempest.txt


sed -i '/<table/,/table>/d' TheTempest.txt
sed -i 's/<[^<]*>//g' TheTempest.txt
sed -i '/</d' TheTempest.txt
sed -i '/>/d' TheTempest.txt

exit 0
