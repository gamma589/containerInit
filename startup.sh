#!/bin/sh
ALLOWED_CONFIG_TYPE="env file"
if [ -z "$CONFIG_TYPE" ]
then
    echo "CONFIG_TYPE is empty, entering infinite loop to allow debug"
    while true; do sleep 86400; done
else
    if [[ " ${ALLOWED_CONFIG_TYPE[@]} " ~= " ${CONFIG_TYPE} " ]]
    then
        echo "valid CONFIG_TYPE variable"
    fi
    echo "CONFIG_TYPE is NOT empty"
fi

if [ -f "$CONFIG_PATH" ]; then
    echo "$CONFIG_PATH exists"
else
    echo "CONFIG_PATH is empty or invalid, entering infinite loop to allow debug"
    while true; do sleep 86400; done
fi

if [ $CONFIG_TYPE == "env" ]
then
    echo "Populating environment using variables in $CONFIG_PATH ..."
    export $(grep -v '^#' $CONFIG_PATH | xargs)
else
    echo "Writing environment variables to $CONFIG_PATH ..."
    env > $CONFIG_TYPE
fi


env
cd /app
npm run start:dev --port $PORT