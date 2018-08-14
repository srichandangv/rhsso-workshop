#!/bin/bash -e

mkdir -p tmp

cd tmp

LATEST_RELEASE=`curl -s https://github.com/minishift/minishift/releases/latest | awk -F 'tag/' '{ print $2 }' | cut -d '"' -f 1 | sed 's/v//'`
URL="https://github.com/minishift/minishift/releases/download/v$LATEST_RELEASE/minishift-$LATEST_RELEASE-linux-amd64.tgz"
curl -s -L $URL | tar --strip-components=1 -zxf - minishift-$LATEST_RELEASE-linux-amd64/minishift

minishift start --memory 8GB --cpus 4
minishift addon enable admin-user
minishift addon apply admin-user
