#!/bin/bash

export SQLANY16 /opt/sqlanywhere16
sudo apt-get update -y
sudo apt-get install -y expect --no-install-recommends
sudo wget http://d5d4ifzqzkhwt.cloudfront.net/sqla16developer/bin/sqla16developerlinux.tar.gz
sudo tar xf sqla16developerlinux.tar.gz --strip 2
sudo expect setup16.expect
echo "/opt/sqlanywhere16/lib64" | sudo tee /etc/ld.so.conf.d/sqlanywhere.conf
sudo ldconfig

cd /opt/sqlanywhere16

/opt/sqlanywhere/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} demo.db
