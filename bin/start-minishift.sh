#!/bin/bash -e

minishift start --memory 4GB --cpus 2
minishift addon enable admin-user
minishift addon apply admin-user
