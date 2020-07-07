#!/bin/bash
echo "Welcome to Gambling Simulator"
stakePerDay=100
betPerGame=1
daysPlayed=1
total=0
totalDays=20
totalStake=$(( $stakePerDay * $totalDays ))
lowerStake=$(( $stakePerDay/2  ))
upperStake=$(( $stakePerDay + $lowerStake ))


while (( $daysPlayed <= $totalDays ))
do
	stakePerDay=100
	while (( $stakePerDay > $lowerStake && $stakePerDay < $upperStake ))
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

if [ $total -ge $totalStake ]
then
	echo "you are left with \$$total on the winning side, after $totalDays days"
else
	echo "you are left with \$$total on the losing side, after $totalDays days"
fi
