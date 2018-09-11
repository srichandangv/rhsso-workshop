#!/bin/bash -e
source bin/env.sh

# This part can be replaced by OpenShift generated certs, once https://issues.jboss.org/browse/WFLY-11007 is solved.
openssl genrsa -out ./keycloak.key 2048
openssl req -x509 -new -nodes -key ./keycloak.key -sha256 -days 1024 -out ./keycloak.crt -subj "/CN=keycloak-keycloak.${OC_PUBLIC_IP}.nip.io"

openssl genrsa -out ./keycloak-client.key 2048
openssl req -new -key ./keycloak-client.key -out ./keycloak-client.csr -subj "/CN=demo-mutual-tls-keycloak.${OC_PUBLIC_IP}.nip.io"
openssl x509 -req -in ./keycloak-client.csr -CA ./keycloak.crt -CAkey ./keycloak.key -CAcreateserial -out ./keycloak-client.crt -days 1024 -sha256

oc create secret tls keycloak-server-tls --cert=./keycloak.crt --key=./keycloak.key
oc create secret tls keycloak-client-tls --cert=./keycloak-client.crt --key=./keycloak-client.key

oc new-app -f keycloak/keycloak.json \
-p KEYCLOAK_USER=admin \
-p KEYCLOAK_PASSWORD=admin
