#!/bin/bash

#declaring an array to maintain players
declare -a player

#Initializing start and win positions
START_POSITION=0
WIN_POSITION=100

#Assigning players to their initial position
player1=$START_POSITION
echo -e  "Starting position of player1 :  $player1 \n"

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

#Counter for number of times dice is rolled to play
diceCount=0

#Condition to play until player reach winning position
while [[ $player1 -lt $WIN_POSITION ]]
do

	#Incrementing counter
	diceCount=`expr $diceCount + 1`

	#Randomly getting the value  of dice after rolling to play
	diceValue=$(( RANDOM % 6 + 1 ))
	echo "Result of dice rolled : " $diceValue

	#Randomly generating  option to decide further action to play
	playOption=$(( RANDOM % 3 ))

	case $playOption in
		0) echo "Option : No Play."
			echo -e  "Position of player 1 after $diceCount dice roll is $player1 \n";;

		1) echo "Option : Sanke Bite"
			player1=$(snakeBite $player1 $diceValue)
			echo -e "Position of player 1 after $diceCount dice roll is $player1 \n";;

		2) echo "Option : Climb Ladder"
			player1=$(climbLadder $player1 $diceValue)
			echo -e "Position of player 1 after $diceCount dice roll is $player1 \n";;
	esac
done

echo "No of times dice rolled : "$diceCount
