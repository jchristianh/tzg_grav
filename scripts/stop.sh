#!/bin/bash
#
# Simple script to stop
# the container
#
# Chris H. <chris@thezengarden.net>
####################################

. .env

docker stop ${CNAME} && docker rm ${CNAME}
