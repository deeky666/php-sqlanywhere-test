#!/bin/bash

export SQLANY16=/opt/sqlanywhere16
apt-get update -y
apt-get install -y expect --no-install-recommends
wget http://d5d4ifzqzkhwt.cloudfront.net/sqla16developer/bin/sqla16developerlinux.tar.gz
tar xf sqla16developerlinux.tar.gz --strip 2
expect setup16.expect
echo "/opt/sqlanywhere16/lib64" > /etc/ld.so.conf.d/sqlanywhere.conf
ldconfig

cd /opt/sqlanywhere16

/opt/sqlanywhere/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} demo.db
