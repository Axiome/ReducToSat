#!/bin/bash

graphe=( )
i=$#
while [ $i != 0 ]
do
	graphe=( ${graphe[@]} $1 )
	i=$(( $i - 1 ))
	shift
done

./reduction-Kernel_Sat ${graphe[@]} > reduc-Kernel.cnf
./minisat reduc-Kernel.cnf result-Kernel.txt

for w in $(cat result-Kernel.txt)
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
				echo $i : dans le noyaux
			else
				if [[ $w -lt 0 ]]
				then
					echo $i : pas dans le noyaux
				fi
			fi
			i=$(( $i + 1 ))
		fi
	fi
done
