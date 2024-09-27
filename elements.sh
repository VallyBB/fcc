#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument given
if [[  -z $1 ]]
then
    echo "Please provide an element as an argument."
    exit
fi

# if argument is a number
if [[ $1 =~ ^[0-9]+$ ]]
then
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number = $1")
else
    # if argument is a symbol or name
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol ILIKE '$1' OR name ILIKE '$1'")
fi

if [[ -n $ELEMENT_DATA ]]
then
    IFS=" | " read ATOMIC_NUMBER NAME SYMBOL TYPE WEIGHT MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS <<< "$ELEMENT_DATA"
    # output the result
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
else
    # if element does not exist (check if no data was returned)
    echo "I could not find that element in the database."
    exit 0
fi