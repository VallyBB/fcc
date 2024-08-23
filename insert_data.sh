#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv into teams database
echo $($PSQL "TRUNCATE TABLE games, teams;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # get WINNER team id (check if the team name is already in db)
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' ")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert WINNER team in teams db
      INSERT_TEAM_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    # get OPPONENT team id (check if the team name is already in db)
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' ")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert OPPONENT team in teams db
      INSERT_TEAM_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
done

# Script to insert data from games.csv into games database
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # get winner and opponent ids
    WINNER_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT'")
    # insert into db
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$W_GOALS', '$O_GOALS')")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR - $ROUND - $WINNER_ID - $OPPONENT_ID - $W_GOALS - $O_GOALS
      fi
  fi
done
