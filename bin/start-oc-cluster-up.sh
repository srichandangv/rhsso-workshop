#!/bin/bash -e

export OC_PUBLIC_IP=172.17.0.1
oc cluster up --public-hostname=$OC_PUBLIC_IP
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin developer