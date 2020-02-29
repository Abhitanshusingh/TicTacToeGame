#!/bin/bash -x
printf "Welcome to tic tac toe game \n"
declare -a board
board=(" " " " " " " " " " " " " " " " " ")
function displayBoard()
{
printf "\t\t\t      |     |     \n"
printf "\t\t\t   ${board[0]}  |  ${board[1]}  |  ${board[2]}  \n"
printf "\t\t\t _____|_____|_____\n"
printf "\t\t\t      |     |     \n"
printf "\t\t\t  ${board[3]}   |  ${board[4]}  |  ${board[5]}  \n"
printf "\t\t\t _____|_____|_____\n"
printf "\t\t\t      |     |     \n"
printf "\t\t\t  ${board[6]}   |  ${board[7]}  |  ${board[8]}  \n"
}
function assiningLetter
{
#GENERATING RANDOM VALUE TO ASSIGN PLAYER O OR X
random=$((RANDOM%2+1))
case $random in
	1)
		player="X"
		computer="O"
		;;
	2)
		player="O"
		computer="X"
		;;
esac
}
function checkToss
{
#GENERATING RANDOM VALUE 1 FOR PALYER 2 FOR COMPUTER
toss=$((RANDOM%2+1))
case $toss in
	1)
		echo "Player play first"
		;;
	2)
		echo "Computer play first"
		;;
esac
}
displayBoard
