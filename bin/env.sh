#!/bin/bash -e

export OC_PUBLIC_IP=`oc whoami --show-server=true | grep -Pom 1 '[0-9.]{7,15}'`

which oc &>/dev/null || eval $(minishift oc-env)
oc whoami &>/dev/null || oc login -u admin -p admin &>/dev/null

oc project keycloak &>/dev/null || oc new-project keycloak