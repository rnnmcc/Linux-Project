#!/bin/bash

awk -F , '{print $2}' stations.csv >stno.txt


for STNO in `cat stno.txt`
do
 wget -O ${STNO}.csv https://cli.fusio.net/cli/climate_data/webdata/dly${STNO}.csv
 sed -i '/,0,/!d' ${STNO}.csv
done

# Average Max Temperature
echo "Average Overall Temperature by Station Number" >report.txt
for STNO in `cat stno.txt`
do
 echo "${STNO}: $(awk -F , '{total += ($3 + $5)/2; count++} END {print total/count}' ${STNO}.csv)">>report.txt
done

# date of highest max temperature
for STNO in `cat stno.txt`
do
 echo "${STNO}: $(awk -F , -v max=0 '{if($3>max){date=$1; max=$3}}END{print date, max}' ${STNO}.csv)">>hightemp.txt
done

# date of lowest min temperature
for STNO in `cat stno.txt`
do
 echo "${STNO}: $(awk -F , -v min=0 '{if($5<min){date=$1; min=$5}}END{print date, min}' ${STNO}.csv)">>lowtemp.txt
done

echo -e "\nDates of Maximum Temperatures by Station Number">>report.txt
cat hightemp.txt>>report.txt
echo -e "\nDates of Minimum Temperatures by Station Number">>report.txt
cat lowtemp.txt>>report.txt

# tidy up
for STNO in `cat stno.txt`
do
 rm ${STNO}.csv
done

rm stno.txt
rm hightemp.txt
rm lowtemp.txt
 
exit 0
