#!/bin/bash -x
printf "\t\t\tWelcome to tic tac toe game \n"
#CONSTANT VARIABLE
declare -a board
board=(" " " " " " " " " " " " " " " " " ")
function displayBoard()
{
	printf "\t\t\t      |     |     \n"
	printf "\t\t\t   ${board[0]}  |  ${board[1]}  |  ${board[2]}  \n"
	printf "\t\t\t _____|_____|_____\n"
	printf "\t\t\t      |     |     \n"
	printf "\t\t\t   ${board[3]}  |  ${board[4]}  |  ${board[5]}  \n"
	printf "\t\t\t _____|_____|_____\n"
	printf "\t\t\t      |     |     \n"
	printf "\t\t\t   ${board[6]}  |  ${board[7]}  |  ${board[8]}  \n"
	printf "\t\t\t      |     |     \n"
}
#ASSINING LETTER TO PLAYER AND COMPUTER
function assiningLetter()
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
	checkToss
}
#CHOOSE VALID CELL
function playerTurn()
{	#player=$1
	toss=$((RANDOM%2+1))
	printf "Enter index 0 to 8 to choose position in board\n"
	read userInput
		if [[ (($userInput -lt 9)) && (("${board[$userInput]}"!=X || "${board[$userInput]}"!=O)) ]]
		then
			board[$userInput]="$player"
		else
			printf "Enter valid input\n"
			playerTurn
		fi
}
#LOGIC FOR TO ASSIGN FIRST CHANCE
function checkToss()
{
	#GENERATING RANDOM VALUE 1 FOR PALYER 2 FOR COMPUTER
	toss=$((RANDOM%2+1))
	case $toss in
		1)
			printf "Player play first\n"
			printf "Player assinged: $player\nComputer assinged: $computer\n"
			;;
		2)
			printf "Computer play first\n"
			printf "Computer assinged: $computer\nPlayer assinged: $player\n"
			;;
	esac
}
assiningLetter
#LOGIC FOR WIN  DRAW AND NEXT CHANCE
function gameOver
{
	if [[ "${board[0]} ${board[1]} ${board[2]}" = "X X X" ||  "${board[0]} ${board[1]} ${board[2]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[3]} ${board[4]} ${board[5]}" = "X X X" ||  "${board[3]} ${board[4]} ${board[5]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[6]} ${board[7]} ${board[8]}" = "X X X" ||  "${board[6]} ${board[7]} ${board[8]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[0]} ${board[3]} ${board[6]}" = "X X X" ||  "${board[0]} ${board[3]} ${board[6]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[1]} ${board[4]} ${board[7]}" = "X X X" ||  "${board[1]} ${board[4]} ${board[7]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[2]} ${board[5]} ${board[8]}" = "X X X" ||  "${board[2]} ${board[5]} ${board[8]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[0]} ${board[4]} ${board[8]}" = "X X X" ||  "${board[0]} ${board[4]} ${board[8]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	elif [[ "${board[6]} ${board[4]} ${board[2]}" = "X X X" ||  "${board[6]} ${board[4]} ${board[2]}" = "O O O" ]]
	then
		result="\t!!! Win !!!\n"
	else
		temp=0
		for(( index=0; index<${#board[@]}; index++ ))
		do
			if [[ "${board[$index]}"!=X || "${board[$index]}"!=O ]]
			then
				temp=1
			fi
		done
	if(( $temp==1 ))
	then
		result="Change\n"
	else
		result="Draw\n"
	fi
	fi
	echo $result
}
while((0==0))
do
displayBoard
playerTurn
result="$(gameOver)"
printf "$result\n"
done
