#!/bin/bash

export SQLANY16=`pwd`/sqlanywhere16
export LD_LIBRARY_PATH=`pwd`/sqlanywhere16/lib64

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLV1ZZdDBvSjFPZFU" | tar xz
wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLQnlZZkdMa20zdkU" | tar xz

cd php_sqlanywhere
./configure
make
make install

php -m

./sqlanywhere16/bin64/dbsrv16 -ud -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
