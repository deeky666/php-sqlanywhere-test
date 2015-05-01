#!/bin/bash

export SQLANY16=$HOME/sqlanywhere16

wget http://d5d4ifzqzkhwt.cloudfront.net/sqla16developer/bin/sqla16developerlinux.tar.gz | tar xzf

echo "$HOME/sqlanywhere16/lib64" > /etc/ld.so.conf.d/sqlanywhere.conf
ldconfig

./sqlanywhere16/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
