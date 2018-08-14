#!/bin/bash -e

eval $(tmp/minishift oc-env)

oc delete all -l app=demo-service
