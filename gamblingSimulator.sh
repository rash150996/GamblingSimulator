#!/bin/bash
STAKE_PER_DAY=100
betPerGame=1
daysPlayed=1
total=0
totalDays=10
newStake=0
stakePerDay=0
lowerStake=$(( $newStake/2 ))
upperStake=$(( $newStake+ $lowerStake ))

function trial()
{
while (( $daysPlayed <= $totalDays ))
do
	newStake=$(( $STAKE_PER_DAY + $stakePerDay ))
	lowerStake=$(( $newStake/2 ))
	upperStake=$(( $newStake+ $lowerStake ))

	while (( $newStake > $lowerStake && $newStake < $upperStake ))
	do
 		flip=$(( RANDOM % 2 ))
 		if [ $flip -eq 1 ]
 		then
        		newStake=$(( $newStake + $betPerGame ))
			stakePerDay=$newStake
 		else
        		newStake=$(( $newStake - $betPerGame ))
			stakePerDay=$newStake
 		fi
	done
	if [ $newStake -eq $upperStake ]
	then
		echo "Day $daysPlayed you have won by $lowerStake"
	else
		echo "Day $daysPlayed you have lost by $lowerStake"
	fi
	daysPlayed=$(( $daysPlayed + 1 ))
done
}

echo "Daily Analysis of win-lose for this month"
echo "-----------------------------------------"
trial

