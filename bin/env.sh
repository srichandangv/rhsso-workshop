#!/bin/bash -e

eval $(tmp/minishift oc-env)

oc login -u admin -p admin &>/dev/null
oc project keycloak &>/dev/null