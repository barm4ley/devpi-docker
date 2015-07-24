devpi-docker
============

Running devpi the easy way.

Whats in the box?
-----------------

* Supervisor is the first process to fire up.
* Devpi-server is started on :4040
* Devpi-web plugin
* Nginx is started from supervisor
* Nginx use proxy_pass to reach :4040
* Supervisor will run on boot

Building
--------

Will configure devpi from the latest pypi uploaded version.

```
docker build -t="devpi" .
```

Running
-------

devpi will be installed behind nginx, so you will need to allow port 80.

```
docker run -d --name devpi -p 80:80 devpi
```

Installing
----------

```
#Note: this is boot2docker address
PIP_SERVER=192.168.59.103

#Replace pkg_to_install with real package name
pip3.4 -vvv --trusted-host $PIP_SERVER install --index http://$PIP_SERVER/root/pypi/+simple/ pkg_to_install
```

