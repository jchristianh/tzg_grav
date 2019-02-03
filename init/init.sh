#!/bin/bash
#
# Grav init script
#
# Chris H. <chris@thezengarden.net>
###################################


# use variable for grav ver
# for easier updates
GRAV_VER="1.5.7"

# ssl is causing an error, so for now
# lets dump it:
if [ -f '/etc/apache2/conf.d/ssl.conf' ]
  then mv /etc/apache2/conf.d/ssl.conf /etc/apache2/conf.d/ssl.conf.disabled
fi

# make pid dir since it's not created by default:
if ! [ -d '/run/apache2' ]
  then mkdir -p /run/apache2
fi

# download and get grav into the correct location if
# its not present:
if ! [ -f '/var/www/localhost/htdocs/index.php' ]
then
  cd /var/www/localhost
  wget "https://getgrav.org/download/core/grav-admin/${GRAV_VER}"
  unzip ${GRAV_VER}
  rm -rfv htdocs/*
  mv grav-admin/* htdocs
  mv grav-admin/.htaccess htdocs
  rm -rfv grav-admin
  chown -R apache.apache htdocs
fi

# set owner of installation folder:
chown -R 100.101 /var/www/localhost/htdocs

# symlink install to /grav for easier reference:
if ! [ -h '/grav' ]
  then ln -sf /var/www/localhost/htdocs /grav
fi

# set timezone:
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime

# start apache and drop to a shell:
httpd -k start -D FOREGROUND
