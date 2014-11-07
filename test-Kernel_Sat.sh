#!/bin/bash

#graphe=( 4 5 1 2 2 3 3 4 1 3 2 4 )
#echo "*************** GRAPH #1 ***************"
#echo ${graphe[@]}
#./script-Kernel_Sat.sh ${graphe[@]}
#echo

#graphe=( 10 15 1 2 2 3 3 4 4 5 5 1 1 6 2 7 3 8 4 9 5 10 6 8 7 9 8 10 9 6 10 7 )
#echo "*************** GRAPH #2 ***************"
#echo ${graphe[@]}
#./script-Kernel_Sat.sh ${graphe[@]}
#echo

graphe=( )
./graphGenerator.sh > temp1
for i in $(cat temp1)
do
	graphe=( ${graphe[@]} $i )
done
echo "*************** RANDOM GRAPH #1 ***************"
echo ${graphe[@]}
./script-Kernel_Sat.sh ${graphe[@]}
echo

graphe=( )
./graphGenerator.sh > temp2
for i in $(cat temp2)
do
	graphe=( ${graphe[@]} $i )
done
echo "*************** RANDOM GRAPH #2 ***************"
echo ${graphe[@]}
./script-Kernel_Sat.sh ${graphe[@]}
echo

graphe=( )
./graphGenerator.sh > temp3
for i in $(cat temp3)
do
	graphe=( ${graphe[@]} $i )
done
echo "*************** RANDOM GRAPH #3 ***************"
echo ${graphe[@]}
./script-Kernel_Sat.sh ${graphe[@]}
echo

rm temp1 temp2 temp3
