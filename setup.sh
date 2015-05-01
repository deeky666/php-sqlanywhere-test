#!/bin/bash

export SQLANY16=$HOME/sqlanywhere16

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLV1ZZdDBvSjFPZFU" | tar xz

echo "$HOME/sqlanywhere16/lib64" > /etc/ld.so.conf.d/sqlanywhere.conf
ldconfig

./sqlanywhere16/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
