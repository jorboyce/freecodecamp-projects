#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  #make sure that it isn't just the title row
  if [[ $WINNER != "winner" ]]
  then
    #~~~~~~~~~~~~~~~~
    #Add teams first and get the correct ids for the games table
    #~~~~~~~~~~~~~~~~
    #select team names from teams
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    #if WINNER_ID is null, add it and ping user
    if [[ -z $WINNER_ID ]]
    then 
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then 
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
        echo Added $WINNER to teams using id $WINNER_ID
      fi
    fi
    
    #then do likewise for the losing team
    if [[ -z $OPPONENT_ID ]]
    then 
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then 
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
        echo Added $OPPONENT to teams using id $OPPONENT_ID
      fi
    fi

    #~~~~~~~~~~~~~~~~
    #After the teams table is sorted, safe to add the game to 'games'
    #~~~~~~~~~~~~~~~~
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo Added $YEAR $ROUND, $WINNER vs. $OPPONENT to games.
    #Is that how soccer fans talk about games? idk I don't watch soccer

  fi
done