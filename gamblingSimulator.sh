#!/bin/bash
echo "Welcome to Gambling Simulator"
stakePerDay=100
betPerGame=1
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

echo "you are left with rs.$stakePerDay"

