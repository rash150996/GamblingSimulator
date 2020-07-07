#!/bin/bash
STAKE_PER_DAY=100
BET_PER_GAME=1
TOTAL_DAYS=30

daysPlayed=1
total=0
newStake=0
stakePerDay=0
maxLost=0
maxWon=0
dayWon=0
dayLost=0
month=1
investment=$(( $STAKE_PER_DAY * $TOTAL_DAYS ))


function trial()
{
if [ $stakePerDay -gt 0 ]
then
	stakePerDay=$1
fi
while (( $daysPlayed <= $TOTAL_DAYS ))
do
	newStake=$(( $STAKE_PER_DAY + $stakePerDay ))
	lowerStake=$(( $newStake/2 ))
	upperStake=$(( $newStake+ $lowerStake ))

	while (( $newStake > $lowerStake && $newStake < $upperStake ))
	do
 		flip=$(( RANDOM % 2 ))
 		if [ $flip -eq 1 ]
 		then
        		newStake=$(( $newStake + $BET_PER_GAME ))
			stakePerDay=$newStake
 		else
        		newStake=$(( $newStake - $BET_PER_GAME ))
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
#printf "Day $dayWon is your luckiest day as you won $maxWon\nDay $dayLost is your unluckiest day as you lost $maxLost\n"
echo $stakePerDay
}

while (( $month < 10 ))
do
	totalMoney=$( trial )
	if [ $totalMoney -gt $investment ]
	then
		echo "you are in profit of $(( $totalMoney-$investment )) for month $month"
		totalMoney=$( trial $totalMoney )
	else
		echo "you are at loss of $(( $investment-$totalMoney )) for month $month. "
		break
	fi
((month++))
done

