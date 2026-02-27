#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.
  else
    if [[ "$1" =~ ^[0-9]+$ ]]
      then
        ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1;" )
      else
        ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1' or name='$1';" )
      fi
    if [[ $ATOMIC_NUMBER ]]
      then
        ELEMENT=$($PSQL "select * from elements where atomic_number=$ATOMIC_NUMBER;" )
        PROPERTIES=$($PSQL "select * from properties where atomic_number=$ATOMIC_NUMBER;" )
        TYPE=$($PSQL "select type from types where type_id=(select type_id from properties where atomic_number=$ATOMIC_NUMBER);" )
        IFS="|" read -r AN SYMBOL NAME <<< "$ELEMENT"
        IFS="|" read -r AN AM MP BP TI <<< "$PROPERTIES"
        echo -e "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
      else
        echo I could not find that element in the database.
      fi
  fi
