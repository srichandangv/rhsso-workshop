#!/bin/bash -e

minishift start --memory 6GB --cpus 4
minishift addon enable admin-user
minishift addon apply admin-user
