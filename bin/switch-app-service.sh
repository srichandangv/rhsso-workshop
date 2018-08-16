#!/bin/bash -e
source bin/env.sh

if [ "$1" == "node" ]; then
    SERVICE_URL=https://`oc get routes demo-service -o jsonpath='{.spec.host}'`
    echo "$SERVICE_URL"
elif [ "$1" == "php" ]; then
    SERVICE_URL=https://`oc get routes demo-service-php -o jsonpath='{.spec.host}'`
    echo "$SERVICE_URL"
else
    echo "usage switch-app-service.sh [node|php]"
fi

oc env dc/demo-app SERVICE_URL=$SERVICE_URL