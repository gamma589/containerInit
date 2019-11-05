#!/bin/sh
ALLOWED_CONFIG_TYPE="env file"
if [ -z "$CONFIG_TYPE" ]
then
    echo "\$CONFIG_TYPE is empty, entering infinite loop to allow debug"
    while true; do sleep 86400
else
    if [[ " ${ALLOWED_CONFIG_TYPE[@]} " ~= " ${CONFIG_TYPE} " ]]
    then
        echo "valid CONFIG_TYPE variable"
    fi
    echo "\$CONFIG_TYPE is NOT empty"
fi

if [ -f "$CONFIG_PATH" ]; then
    echo "$CONFIG_PATH exist"
fi
env
cd /app
npm run start:dev --port $PORT