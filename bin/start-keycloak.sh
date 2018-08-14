#!/bin/bash -e

eval $(tmp/minishift oc-env)

oc new-app -f keycloak/keycloak-https.json \
-p KEYCLOAK_USER=admin \
-p KEYCLOAK_PASSWORD=admin
