#!/bin/bash
git clone https://github.com/mongodb/mongo.git
cd mongo
git checkout tags/r$1 -b v$1
python3 -m pip install -r etc/pip/compile-requirements.txt
python3 buildscripts/scons.py install-servers --disable-warnings-as-errors CCFLAGS="-march=goldmont"
cd build/install/bin
for x in mongo*; do strip -s $x; done
mkdir -p /buildoutput
cp * /buildoutput
cd /
