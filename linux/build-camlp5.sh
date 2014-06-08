#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH

wget -nc http://camlp5.gforge.inria.fr/distrib/src/camlp5-${CAMLP5_VER}.tgz
rm -rf camlp5-${CAMLP5_VER}
tar xf camlp5-${CAMLP5_VER}.tgz
cd camlp5-${CAMLP5_VER}

./configure
make world.opt > log.world 2>&1
make install > log.install 2>&1
