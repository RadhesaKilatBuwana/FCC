#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN(){
  # Listing all services
  ALL_SERVICE=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$ALL_SERVICE" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
  echo -e "What kind of service do you want?"
  read SERVICE_ID_SELECTED
  
  # Check if SERVICE_ID_SELECTED matches any service_id from database
  SERVICE_CHECK=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE_CHECK ]]; 
  then
    echo "Sorry, that service does not exist. Please select a valid service."
    MAIN # Re-run MAIN to ask again
  else
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    
    # Check if customer already exists
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    if [[ -z $CUSTOMER_NAME ]]
    then
      # Get new customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME
      # Insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    
    # Get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    # Asking when the appointment will occur
    echo -e "When do you want it?"
    read SERVICE_TIME

    # Insert new appointment
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    
    # Get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
    
    # Final message
    echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN