#!/bin/bash

#calling databse
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate random number between 1-1000
GENERATED_NUMBER=$((1 + $RANDOM%1000 ))

#ask username
echo Enter your username:
read USERNAME

CHECK_USERNAME=$($PSQL "select name from games where name='$USERNAME'" )

#welcome messages
if [[ -z $CHECK_USERNAME ]]
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "select count(*) from games where name='$USERNAME'" )
    BEST_GAME=$($PSQL "select min(guess) from games where name='$USERNAME'" )
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

#game began
echo Guess the secret number between 1 and 1000:
read GUESS
NUMBER_OF_GUESS=1
while [[ $GUESS -ne $GENERATED_NUMBER ]]
  do
    if [[  ! "$GUESS" =~ ^-?[0-9]+$  ]]
      then
          echo "That is not an integer, guess again:"
          read GUESS
      elif [[ $GUESS -gt $GENERATED_NUMBER ]]
        then
          echo "It's lower than that, guess again:"
          read GUESS
          (( NUMBER_OF_GUESS++ ))
      elif [[ $GUESS -lt $GENERATED_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read GUESS
          (( NUMBER_OF_GUESS++ ))
      fi
  done

#game end
echo -e "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $GENERATED_NUMBER. Nice job!"

#insert to database
INSERT_GAME=$($PSQL "insert into games(name,guess) values('$USERNAME',$NUMBER_OF_GUESS)" )