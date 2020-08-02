#!/bin/bash 

#declaring an array to maintain players
declare -a player

#Initializing start and win positions
START_POSITION=0
WIN_POSITION=100

#Assigning players to their initial position
player1=$START_POSITION
echo "Position of player1 : " $player1

#Randomly getting the value  of dice after rolling to play
diceValue=$(((RANDOM % 6) + 1 ))
echo "Result of dice rolled : " $diceValue
