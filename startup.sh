#!/bin/sh
ALLOWED_CONFIG_TYPE="env file none"
if [ -z "$CONFIG_TYPE" ]
then
    echo "CONFIG_TYPE is empty, entering infinite loop to allow debug"
    while true; do sleep 86400; done
else
    # if [[ " ${ALLOWED_CONFIG_TYPE[@]} " ~= " ${CONFIG_TYPE} " ]]
    # then
    #     echo "valid CONFIG_TYPE variable"
    # fi
    echo "CONFIG_TYPE is NOT empty"
fi

if [ -f "$CONFIG_PATH" ]; then
    echo "$CONFIG_PATH exists"
else
    if [ x$CONFIG_TYPE = x"none" ]; then
        echo "CONFIG_PATH is empty but not required"
    else
        echo "CONFIG_PATH is empty or invalid, entering infinite loop to allow debug"
        while true; do sleep 86400; done
    fi
fi

if [ x$CONFIG_TYPE = x"env" ]
then
    echo "Populating environment using variables in $CONFIG_PATH ..."
    export $(grep -v '^#' $CONFIG_PATH | xargs)
elif [ x$CONFIG_TYPE = x"file" ]
then
    echo "Writing environment variables to $CONFIG_PATH ..."
    #ensure that the user in the Dockerfile USER directive has permissions to overwrite the $CONFIG_PATH file
    env > $CONFIG_PATH
else
    echo "Container needs no variables or they are handled by some other means"
fi


env
cd /app
npm run start:dev --port $PORT