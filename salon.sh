#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {

    # Print a message passed as a first argument ($1)
    if [[ -n $1 ]]; then
        echo -e "\n$1"
    fi

    echo -e "\n~~~~~ Salon Ginni-Ginni & Sons ~~~~~\n"
    
    # Display services
    SERVICES_OFFERED=$($PSQL "SELECT service_id, name FROM services")
    
    echo "$SERVICES_OFFERED" | while IFS=" | " read SERVICE_ID SERVICE_NAME
    do
        echo "$SERVICE_ID) $SERVICE_NAME"
    done

    echo -e "\nSelect service (enter service ID):"
    read SERVICE_ID_SELECTED
    
    # Ensure valid service ID is selected
    VALID_SERVICE_CHECK=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    if [[ -z "$VALID_SERVICE_CHECK" ]] # variable is enclosed in double quotes to handle spaces and special characters correctly. 
    then
        MAIN_MENU "I could not find that service. What would you like today?"
    else
        MAKE_APPOINTMENT "$SERVICE_ID_SELECTED"
    fi
}

MAKE_APPOINTMENT() {
    SERVICE_ID_SELECTED=$1
    # prompt for phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # retrieve customer name based on phone number
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if no customer found, ask for name and add to database
    if [[ -z "$CUSTOMER_NAME" ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        
        # insert new customer into database
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        if [[ "$INSERT_CUSTOMER_RESULT" != "INSERT 0 1" ]]; then
            echo "Error inserting new customer."
            exit 1
        fi
    fi

    # prompt for service time
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # retrieve customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    if [[ "$INSERT_APPOINTMENT_RESULT" != "INSERT 0 1" ]]; then
        echo "Error inserting appointment."
        exit 1
    fi

    # retrieve service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

    # confirm appointment
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

    EXIT

}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU