#!/bin/bash -e
source bin/env.sh

oc new-app -f keycloak/keycloak.json \
-p KEYCLOAK_USER=admin \
-p KEYCLOAK_PASSWORD=admin
