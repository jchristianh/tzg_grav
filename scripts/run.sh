#!/bin/bash
#
# Simple script to run the
# container
#
# Chris H. <chris@thezengarden.net>
####################################

. .env

docker run -ti -d --name ${CNAME} --hostname ${CNAME} \
  -v dockergrav_tzg_grav:/var/www/localhost/htdocs \
  -p ${CPORT}:80 ${CIMG}:${CTAG}
