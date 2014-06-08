#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH

wget -nc http://ssr.msr-inria.inria.fr/FTP/ssreflect-${SSREFLECT_VER}.tar.gz
rm -rf ssreflect-${SSREFLECT_VER}
tar xf ssreflect-${SSREFLECT_VER}.tar.gz
cd ssreflect-${SSREFLECT_VER}
make Makefile.coq
make -f ../ssreflect-pp.mk ssreflect-pp
cp src/ssreflect.ml src/ssrmatching.ml ../..
