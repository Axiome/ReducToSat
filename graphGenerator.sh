#!/bin/bash

n=$(( $RANDOM % 20 ))
while [ $n -eq 0 ]
do
	n=$(( $RANDOM % 20 ))
done

nbedges=$(( $RANDOM % ( 5*n ) ))

while [ $nbedges -lt $n ]
do
	nbedges=$(( $RANDOM % ( 5*n ) ))
done

graphe=( $n $nbedges )

i=0
while [ $i -lt $nbedges ]
do
	vertex1=$(( $RANDOM % $n ))
	while [ $vertex1 -eq 0 ]
	do
		vertex1=$(( $RANDOM % $n ))
	done
	vertex2=$(( $RANDOM % $n ))
	while [ $vertex2 -eq 0 ]
	do
		vertex2=$(( $RANDOM % $n ))
	done
	if [[ $vertex1 -ne $vertex2 ]]
	then	
		graphe=( ${graphe[@]} $vertex1 $vertex2 )
		i=$(( $i + 1 ))
	fi
done

echo ${graphe[@]}
