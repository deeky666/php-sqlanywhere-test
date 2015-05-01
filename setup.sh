#!/bin/bash

export SQLANY16=`pwd`/sqlanywhere16
export LD_LIBRARY_PATH=`pwd`/sqlanywhere16/lib64

wget -qO- "https://drive.google.com/uc?export=download&id=0BxDG3LHQ2MkLV1ZZdDBvSjFPZFU" | tar xz

echo $SQLANY16
echo $LD_LIBRARY_PATH
pwd

./sqlanywhere16/bin64/dbsrv16 -x tcpip{DOBROADCAST=NO} ./sqlanywhere16/demo.db
