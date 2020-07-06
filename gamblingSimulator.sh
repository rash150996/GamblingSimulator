#!/bin/bash
echo "Welcome to Gambling Simulator"
stakePerDay=100
betPerGame=1
daysPlayed=0
total=0

while (( $daysPlayed < 20 ))
do
	stakePerDay=100
	while (( $stakePerDay > 50 && $stakePerDay < 150 ))
	do
 	flip=$(( RANDOM % 2 ))
 	if [ $flip -eq 1 ]
 	then
        stakePerDay=$(( $stakePerDay + $betPerGame ))
 	else
        stakePerDay=$(( $stakePerDay - $betPerGame ))
 	fi
	done
   total=$(( $total + $stakePerDay ))
	daysPlayed=$(( $daysPlayed + 1 ))
done

if [ $total > 2000 ]
then
	echo "you are left with \$$total on the winning side"
else
	echo "you are left with \$$total on the losing side"
fi
