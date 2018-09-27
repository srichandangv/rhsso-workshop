#!/bin/bash -e
source bin/env.sh

oc delete all -l app=keycloak
oc delete secret keycloak-server-tls
oc delete secret keycloak-client-tls
