#!/bin/bash

export SQLANY16=$HOME/sqlanywhere16
export LD_LIBRARY_PATH=$HOME/sqlanywhere16/lib64

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLV1ZZdDBvSjFPZFU" | tar xz

echo "$HOME/sqlanywhere16/lib64" > /etc/ld.so.conf.d/sqlanywhere.conf
ldconfig

echo $SQLANY16
echo $LD_LIBRARY_PATH

cd ./sqlanywhere16

./sqlanywhere16/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} demo.db
