#!/bin/bash
echo "Welcome to Gambling Simulator"
stakePerDay=100
betPerGame=1
flip=$(( RANDOM % 2 ))
if [ $flip -eq 1 ]
then
	echo "You won the bet"
	total=$(( $stakePerDay + $betPerGame ))
else
	echo "You lost the bet"
	total=$(( $stakePerDay - $betPerGame ))
fi

echo "You are left with \$$total"
