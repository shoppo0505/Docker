#!/bin/sh
TOKEN="NTYxNzBhYTYtODQxNi00OTZmLThmOTItYzhmMmQ4MTVhYWI2"
if [[ -n "${TOKEN}" ]]
then
    echo "authToken is  ${TOKEN}"
    cpolar authtoken ${TOKEN}
    echo "cpolar is starting!"
    cpolar http 80
    stop
else
    echo "Please set the environment variable token!!!!"
    stop
fi
