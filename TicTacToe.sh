#!/bin/bash -x
declare -a board
function displayBoard()
{
printf "Welcome to tic tac toe game \n"
printf "\t\t\t     |     |     \n"
printf "\t\t\t   ${board[0]}  |  ${board[1]}   |  ${board[3]}  \n"
printf "\t\t\t_____|_____|_____\n"
printf "\t\t\t     |     |     \n"
printf "\t\t\t  ${board[4]}   |  ${board[5]}   |  ${board[6]}  \n"
printf "\t\t\t_____|_____|_____\n"
printf "\t\t\t     |     |     \n"
printf "\t\t\t  ${board[7]}   |  ${board[8]}   |  ${board[9]}  \n"

}
displayBoard
