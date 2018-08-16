#!/bin/bash -e

which oc &>/dev/null || eval $(minishift oc-env)
oc whoami &>/dev/null | oc login -u admin -p admin &>/dev/null

oc project keycloak &>/dev/null