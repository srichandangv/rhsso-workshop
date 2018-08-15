#!/bin/bash -e
source bin/env.sh

KEYCLOAK_URL=https://`oc get routes keycloak -o jsonpath='{.spec.host}'`/auth

oc get buildconfigs demo-service-php &>/dev/null || oc new-build --binary=true --name=demo-service-php
oc start-build demo-service-php --from-dir=demo-service-php --follow

oc new-app -f demo-service-php/demo-service-php.json -p KEYCLOAK_URL=$KEYCLOAK_URL
