#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Rebuild the database on each run.
TRUNCATE_RESULT=$($PSQL "TRUNCATE TABLE teams, games;")

# For each line, with each column seperated by ',', queries and adds information to our worldcup database.
cat games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # Inserts both winner, and opponent team names, however on name conflict it does nothing (preventing duplicates).
    TEAM_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT (name) DO NOTHING;")
    echo "Inserted opponent name result: $TEAM_WIN_RESULT"

    OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT (name) DO NOTHING;")
    echo "Inserted opponent name result: $OPPONENT_RESULT"

    # Inserts game information.
    GAME_DATA=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', (SELECT team_id FROM teams WHERE name='$WINNER'), (SELECT team_id FROM teams WHERE name='$OPPONENT'), $WINNER_GOALS, $OPPONENT_GOALS);")
    echo "Inserted game data result: $GAME_DATA"
  fi
done