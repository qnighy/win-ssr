#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH
export PATH=${WIN_COQ_DIR}/bin:$PATH
export COQBIN=${WIN_COQ_DIR}/bin/

wget -nc http://ssr.msr-inria.inria.fr/FTP/mathcomp-${SSREFLECT_VER}.tar.gz
rm -rf mathcomp-${SSREFLECT_VER}
tar xf mathcomp-${SSREFLECT_VER}.tar.gz
cd mathcomp-${SSREFLECT_VER}
/usr/bin/make
/usr/bin/make install
