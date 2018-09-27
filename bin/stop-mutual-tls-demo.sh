#!/bin/bash -e
source bin/env.sh

oc delete all --selector=application=demo-mutual-tls || true
oc delete buildconfigs demo-mutual-tls || true
oc delete is demo-mutual-tls || true
