#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# We first ensure that the user doesn't provide an empty argument. Informing them of such.
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# We siphon our conditions to allow for either number based input, or text based input for the provided argument.
if [[ $1 =~ ^[0-9]+$ ]]
then
  CONDITION="atomic_number='$1'"
else
  CONDITION="symbol='$1' OR name='$1'"
fi

# Checks to ensure that the provided argument does exist in our database, providing relevent information if so.
ELEMENT=$($PSQL "SELECT * FROM elements WHERE $CONDITION;")
if [ -z $ELEMENT ]
then
  echo "I could not find that element in the database."
else
  $PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $CONDITION;" | while IFS='|' read -r TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
fi