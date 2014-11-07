#!/bin/bash

graphe=( )
i=$#
while [ $i != 0 ]
do
	graphe=( ${graphe[@]} $1 )
	i=$(( $i - 1 ))
	shift
done

./reduction-3Col_Sat ${graphe[@]} > reduc.cnf
./minisat reduc.cnf result.txt

i=0
for w in $(cat result.txt)
do
	if [[ $i == 0 ]] 
	then
		if [[ $w == "SAT" ]]
		then
			sat=1
		else
			sat=0
		fi
		i=$(( $i + 1 ))
	else
		if [[ $sat ]]
		then
			if [[ $w -gt 0 ]]
			then
				color=$(( $w % 3 ))
				if [[ $color == 1 ]]
				then
					echo $i : rouge
				fi
				if [[ $color == 2 ]]
				then
					echo $i : vert
				fi
				if [[ $color == 0 ]]
				then
					echo $i : bleu
				fi
				i=$(( $i + 1 ))
			fi
		fi
	fi
done

rm reduc.cnf
