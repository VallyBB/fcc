#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$(( RANDOM % 1000 + 1 )) # "+ 1": shifts the range from 0-999 to 1-1000.


echo "Enter your username:"
read USER_NAME_INPUT
USERNAME=$($PSQL "SELECT username FROM games WHERE username='$USER_NAME_INPUT' GROUP BY username")

if [[ -n $USERNAME ]]
# existing user
then
    GAMES_PLAYED=$($PSQL "SELECT MAX(game_number) FROM games WHERE username='$USERNAME'") 
    BEST_GAME=$($PSQL "SELECT MIN(guesses_amt) FROM games WHERE username='$USERNAME'")
    GAME_NUMBER=$((GAMES_PLAYED + 1))
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    
else
# if new user
  GAME_NUMBER=1
  echo "Welcome, $USER_NAME_INPUT! It looks like this is your first time here."
fi


GUESSES_AMT=0

# run this while user not guessed the secret number
echo "Guess the secret number between 1 and 1000:"
while true; do
    read GUESS_NUM # read user input

    ((GUESSES_AMT++))

    if ! [[ $GUESS_NUM =~ ^[0-9]+$ ]]; then
        echo -e "\nThat is not an integer, guess again:" 
        if [[ GUESSES_AMT > 0 ]]; then
            GUESSES_AMT=$((GUESSES_AMT - 1))
        fi
        
    elif (( GUESS_NUM > SECRET_NUMBER )); then
        echo -e "\nIt's lower than that, guess again:"
    elif (( GUESS_NUM < SECRET_NUMBER )); then
        echo -e "\nIt's higher than that, guess again:"
    elif (( GUESS_NUM == SECRET_NUMBER )); then
        
        # insert the guess into games DB
        INSERT_USER_GUESS_RESULT=$($PSQL "INSERT INTO games(username, game_number, guesses_amt) VALUES('$USER_NAME_INPUT', $GAME_NUMBER, $GUESSES_AMT)")
        
        echo "You guessed it in $GUESSES_AMT tries. The secret number was $SECRET_NUMBER. Nice job!"
        exit

    fi
done