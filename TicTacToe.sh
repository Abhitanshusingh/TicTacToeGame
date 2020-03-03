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
{
	printf "Enter index 0 to 8 to choose position in board\n"
	read userInput
		if [[ $userInput -lt 9 ]] && [[ ${board[$userInput]} != "X" && ${board[$userInput]} != "O" ]]
		then
			#USING CLEAR TO CLEAN PREVIOUS PLAYED
			clear
			printf "Player turn\n"
			board[$userInput]="$player"
			displayBoard
		else
			printf "Enter valid input\n"
			playerTurn $player
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
			displayBoard
			;;
		2)
			printf "Computer play first\n"
			printf "Computer assinged: $computer\nPlayer assinged: $player\n"
			tossComputer="computer"
			;;
	esac
}
#assiningLetter
#LOGIC FOR WIN  DRAW AND NEXT CHANCE
function gameOver()
{
	if [[ "${board[0]} ${board[1]} ${board[2]}" = "X X X" ||  "${board[0]} ${board[1]} ${board[2]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[3]} ${board[4]} ${board[5]}" = "X X X" ||  "${board[3]} ${board[4]} ${board[5]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[7]} ${board[8]}" = "X X X" ||  "${board[6]} ${board[7]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[3]} ${board[6]}" = "X X X" ||  "${board[0]} ${board[3]} ${board[6]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[1]} ${board[4]} ${board[7]}" = "X X X" ||  "${board[1]} ${board[4]} ${board[7]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[2]} ${board[5]} ${board[8]}" = "X X X" ||  "${board[2]} ${board[5]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[0]} ${board[4]} ${board[8]}" = "X X X" ||  "${board[0]} ${board[4]} ${board[8]}" = "O O O" ]]
	then
		result="Win"
	elif [[ "${board[6]} ${board[4]} ${board[2]}" = "X X X" ||  "${board[6]} ${board[4]} ${board[2]}" = "O O O" ]]
	then
		result="Win"
	else
		temp=0
		for(( index=0; index<${#board[@]}; index++ ))
		do
			if [[ ${board[$index]} != "X" && ${board[$index]} != "O" ]]
			then
				temp=1
			fi
		done
	if(( $temp==1 ))
	then
		result="Change"
	else
		result="Draw"
	fi
	fi
	echo $result
}
#LOGIC FOR COMPUTER TURN
function computerTurn()
{
	computerPlay=$((RANDOM%8))
	if [[ ${board[$computerPlay]} != "X" ]] && [[ ${board[$computerPlay]} != "O" ]]
	then
		echo "Computer turn"
		board[$computerPlay]="$computer"
		displayBoard
	else
		computerTurn $computer
	fi
}
	#LOGIC FOR TO PLAY UPTO WIN OR DRAW
   assiningLetter
	temp=0
	if [[ "$tossComputer" = "computer" ]]
	then
	   temp=1
	fi
	while (( 0==0 ))
	do
	   if(( $temp%2==0 ))
	   then
	      playerTurn
			result="$(gameOver $player)"
	      if [[ $result == "Win" ||  $result == "Draw" ]]
	      then
	         printf " Player $result\n"
	         break
	      fi
	   else
	      computerTurn
			result="$(gameOver $computer)"
	      if [[ $result == "Win"  ||  $result == "Draw" ]]
	      then
	         printf " Computer $result\n"
	         break
	      fi
	   fi
	   temp=$(($temp+1))
	done
displayBoard
