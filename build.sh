#!/bin/bash
git clone https://github.com/mongodb/mongo.git
cd mongo
version="$1"
shift 1
git checkout tags/r$version -b v$version
python3 -m pip install -r etc/pip/compile-requirements.txt
python3 buildscripts/scons.py install-servers --disable-warnings-as-errors CCFLAGS="-march=goldmont" $@
cd build/install/bin
for x in mongo*; do strip -s $x; done
mkdir -p /buildoutput
cp * /buildoutput
cd /
