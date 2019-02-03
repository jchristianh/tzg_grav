#!/bin/bash
#
# Simple script for manual image builds
#
# Chris H. <chris@thezengarden.net>
#######################################

. .env

docker build --no-cache -t docker.thezengarden.net/grav:dev .
