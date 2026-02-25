#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Read .csv file to insert new data
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != year ]]
    then
      #Check if teams in table
      WIN_ID=$( $PSQL "select team_id from teams where name='$WINNER'" )
      OPP_ID=$( $PSQL "select team_id from teams where name='$OPPONENT'" )
      #if winner not found
      if [[ -z $WIN_ID ]]
        then
          INSERT_WINNER=$( $PSQL "insert into teams(name) values('$WINNER')" )
          WIN_ID=$( $PSQL "select team_id from teams where name='$WINNER'" )
      fi
      #if opponent not found
      if [[ -z $OPP_ID ]]
        then
          INSERT_OPP=$( $PSQL "insert into teams(name) values('$OPPONENT')" )
          OPP_ID=$( $PSQL "select team_id from teams where name='$OPPONENT'" )
      fi
      #Insert games
      INSERT_GAME=$( $PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WIN_ID,$OPP_ID,$WGOALS,$OGOALS)" )
  fi
done
