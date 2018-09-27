#!/bin/bash -e
source bin/env.sh

KEYCLOAK_URL=https://`oc get routes keycloak -o jsonpath='{.spec.host}'`/auth

mvn install -f demo-mutual-tls/pom.xml
oc delete all --selector=application=demo-mutual-tls || true
oc get buildconfigs demo-mutual-tls &>/dev/null || oc new-build --name=demo-mutual-tls --binary=true
oc start-build demo-mutual-tls --from-dir=demo-mutual-tls --follow

oc new-app -f demo-mutual-tls/demo-mutual-tls.json -p KEYCLOAK_URL=$KEYCLOAK_URL
