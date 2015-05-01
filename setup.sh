#!/bin/bash

export SQLANY16=`pwd`/sqlanywhere16
export LD_LIBRARY_PATH=`pwd`/sqlanywhere16/lib64

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLYm93Tm9QUGFZY1U" | tar xz
wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLS1oxaUQzTy1Jczg" | tar xz

echo "extension = `pwd`/php_sqlanywhere/sqlanywhere_$(phpenv version-name).so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini

php -m

./sqlanywhere16/bin64/dbsrv16 -ud -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
