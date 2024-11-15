#!/bin/bash

response=$(curl --write-out %{http_code} --silent --output /dev/null localhost:$1)

if [ $response -eq 200 ]
then
    #echo -e "\U2588"
    echo -e "\U25A0"
fi
