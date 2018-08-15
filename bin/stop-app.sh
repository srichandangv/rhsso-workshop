#!/bin/bash -e
source bin/env.sh

oc delete all -l app=demo-app
