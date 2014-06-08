#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH

wget -nc http://coq.inria.fr/distrib/V${COQ_VER}/files/coq-${COQ_VER}.tar.gz
rm -rf coq-${COQ_VER}
tar xf coq-${COQ_VER}.tar.gz
cd coq-${COQ_VER}
patch -p1 < ../coq-local-open.patch
./configure -prefix $PREFIX -usecamlp5 -coqide no -with-doc no
make world > log.world 2>&1
make install > log.install 2>&1
