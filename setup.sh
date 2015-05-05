#!/bin/bash

#wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLWUUzY2lTcmVjb1k" | tar xz # server
wget -qO- "https://drive.google.com/uc?export=download&id=$SQLANYWHERE_GDRIVE_TOKEN" | tar xz # server
wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLS1oxaUQzTy1Jczg" | tar xz # PHP extensions

echo "extension = `pwd`/php_sqlanywhere/sqlanywhere_$(phpenv version-name).so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini

php -m

./sqlanywhere16/bin64/dbsrv16 -ud -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
