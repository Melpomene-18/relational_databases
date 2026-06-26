#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -A -F, -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to my salon, how can I help you?"

MAIN_MENU() {
  # If provided with an argument, prints it to the console (used for error messages).
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Lists the available services.
  $PSQL "SELECT service_id, name FROM services" | while IFS="," read -r SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # Reads the user choice, which consequently determines what service they choose.
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in # I'm pretty sure a while loop would be better here, but I'm going to assume you won't mess up a bajillion times.
    1) SERVICE_MENU "Haircut" ;;
    2) SERVICE_MENU "Manicure" ;;
    3) SERVICE_MENU "Pedicure" ;;
    *) MAIN_MENU "I can not find that service. What would you like today?" ;;
  esac
}

SERVICE_MENU() {
  # Set a phone number, validate it, then grab their name from the database.
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  if [[ ! $CUSTOMER_PHONE =~ ^[0-9-]{7,12}$ ]]
  then
    MAIN_MENU "$CUSTOMER_PHONE is not a valid phone number, please choose your desired service, and try again."
    return
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # If their name doesn't exist in said database, we ask for them to provide it. Subsequently adding it.
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_NAME_ESC=${CUSTOMER_NAME//\'/\'\'} # HAHA! airlines love this one trick (escapes apostrophes)!
    CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME_ESC')")
  fi

  # Set a time for the appointment, validating it.
  echo -e "\nWhat time would you like your $1, $CUSTOMER_NAME?"
  read SERVICE_TIME
  if [[ ! $SERVICE_TIME =~ ^((0?[1-9]|1[0-2])(:[0-5][0-9])?([AaPp][Mm])?)$ ]] # We assume 12 hour time.
  then
    MAIN_MENU "$SERVICE_TIME is not a valid time, please choose your desired service, and try again."
    return
  fi

  # Insert the appointment into the database. Assumes no errors.
  APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES((SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'), (SELECT service_id FROM services WHERE name='$1'), '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."

  # Appointment has been set, exit the program.
  exit
}

MAIN_MENU