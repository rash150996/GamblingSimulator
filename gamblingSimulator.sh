#!/bin/bash
STAKE_PER_DAY=100
betPerGame=1
daysPlayed=1
total=0
totalDays=10
newStake=0
stakePerDay=0
maxLost=0
maxWon=0
dayWon=0
dayLost=0


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
		#echo "Day $daysPlayed you have won by $lowerStake"
		if [ $lowerStake -gt $maxWon ]
		then
			maxWon=$lowerStake
			dayWon=$daysPlayed
		fi
	else
		#echo "Day $daysPlayed you have lost by $lowerStake"
		if [ $lowerStake -gt $maxLost ]
		then
			maxLost=$lowerStake
			dayLost=$daysPlayed
		fi

	fi
	daysPlayed=$(( $daysPlayed + 1 ))
done
printf "Day $dayWon is your luckiest day as you won $maxWon\nDay $dayLost is your unluckiest day as you lost $maxLost\n"

}

trial

