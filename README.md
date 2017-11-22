### thezengarden/grav:
---

This is a simple Docker image for running a [Grav CMS](https://getgrav.org) based site.

#### Software:

| Software | Version       |
| -------- |--------------:|
| Alpine   | 3.6.2         |
| Apache   | 2.4.27        |
| Grav     | 1.3.8         |
| PHP      | 7.1.9         |

#### Running the container:
##### Environment:
```bash
PWD=`/bin/pwd`
CNAME=tzg_grav
CIMG=thezengarden/grav
CTAG=latest
CPORT=8000
CRESTART=always
CINIT=/init.sh
CGRAV=grav
CHTTPD_CONF=conf/httpd.conf
CMOD_CONF=conf/modules.conf
CWEBLOGS=logs
TZ=US/Eastern
```

##### Detached:
```bash
docker run -ti -d --name ${CNAME} --hostname ${CNAME} \
  -v dockergrav_tzg_grav:/var/www/localhost/htdocs \
  -p ${CPORT}:80 ${CIMG}:${CTAG}
```
##### Interactive shell:
```bash
docker run -ti --rm --name ${CNAME} --hostname ${CNAME} \
  -v dockergrav_tzg_grav:/var/www/localhost/htdocs \
  -p ${CPORT}:80 ${CIMG}:${CTAG} /bin/bash
```

#### GitHub:
[thezengarden/grav - jchristianh](https://github.com/jchristianh/tzg_grav)

#### Maintainers:
[Chris H. \<chris@thezengarden.net\>](mailto:chris@thezengarden.net)
