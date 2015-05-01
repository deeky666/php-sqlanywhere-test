#!/bin/bash

export SQLANY16=`pwd`/sqlanywhere16
export LD_LIBRARY_PATH=`pwd`/sqlanywhere16/lib64

apt-get update -y
apt-get install -y php5-dev  --no-install-recommends

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLV1ZZdDBvSjFPZFU" | tar xz
wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLdmxScC1TR3ZRaTQ" | tar xz

cd php_sqlanywhere
phpize
./configure
make -j`nproc`
make install

echo "extension = sqlanywhere.so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini

php -m

./sqlanywhere16/bin64/dbsrv16 -ud -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
