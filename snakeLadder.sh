#!/bin/bash

#declaring an array to maintain players
declare -a player

#Initializing start and win positions
START_POSITION=0
WIN_POSITION=100

#Assigning players to their initial position
player1=$START_POSITION
echo "Position of player1 : " $player1


#function to be executed when snake bite option occurs
function snakeBite(){
	currentPosition=$1
	moveToPosition=$2
   if [ $(( $currentPosition - $moveToPosition )) -lt $START_POSITION ]
	then
		echo $START_POSITION
	else
		echo $(( $currentPosition - $moveToPosition ))
	fi
}

#function to be executed when climb ladder option occurs
function climbLadder(){
	currentPosition=$1
   moveToPosition=$2
   if [ $(( $currentPosition + $moveToPosition )) -gt $WIN_POSITION ]
	then
		echo $currentPosition
	else
		echo $(( $currentPosition + $moveToPosition ))
	fi
}

while [[ $player1 -lt $WIN_POSITION ]]
do
#Randomly getting the value  of dice after rolling to play
diceValue=$(( RANDOM % 6 + 1 ))
echo "Result of dice rolled : " $diceValue

#Randomly generating  option to decide further action to play
playOption=$(( RANDOM % 3 ))

case $playOption in
	0) echo "Option : No Play."
		echo "Position of player 1 : " $player1;;

	1) echo "Option : Sanke Bite"
		player1=$(snakeBite $player1 $diceValue)
		echo "Position of player 1 : " $player1;;

	2) echo "Option : Climb Ladder"
		player1=$(climbLadder $player1 $diceValue)
		echo "Position of player 1 : " $player1;;
esac
done
