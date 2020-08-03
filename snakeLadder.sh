#!/bin/bash

#Initializing start and win positions
START_POSITION=0
WIN_POSITION=100

#Assigning players to their initial position
player1=$START_POSITION
player2=$START_POSITION

echo -e  "Starting position of player1 :  $player1 \n"
echo -e  "Starting position of player2 :  $player2 \n"

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

function playGame(){
   player=$1
#Randomly getting the value  of dice after rolling to play
diceValue=$(( RANDOM % 6 + 1 ))
echo >&2 "Result of dice rolled : " $diceValue

#Randomly generating  option to decide further action to play
playOption=$(( RANDOM % 3 ))

case $playOption in
      0) echo >&2 "Option : No Play.";;

      1) echo >&2 "Option : Sanke Bite"
         player=$(snakeBite $player $diceValue);;

      2) echo >&2 "Option : Climb Ladder"
         player=$(climbLadder $player $diceValue)
         player=$(playGame $player);;
   esac
 echo $player
}

while [[ $players1 -lt $WIN_POSITION ]] && [[ $player2 -lt $WIN_POSITION ]]
do
   player1=$(playGame $player1)
   echo -e  "Position of player1 is $player1 \n"
   player2=$(playGame $player2)
   echo -e  "Position of player2 is $player2 \n"
done

if [ $player1 -eq $WIN_POSITION ]
then
   echo "Player1 is the winner!!"
else
   echo "Player2 is the winner!!"
fi

