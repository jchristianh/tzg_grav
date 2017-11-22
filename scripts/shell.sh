#!/bin/bash
#
# Simple script to run a shell
# for debugging or perform
# maintenance related tasks
#
# Chris H. <chris@thezengarden.net>
####################################

. .env

docker run -ti --rm --name ${CNAME} --hostname ${CNAME} \
  -v dockergrav_tzg_grav:/var/www/localhost/htdocs \
  -p ${CPORT}:80 ${CIMG}:${CTAG} /bin/bash
