#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH
export PATH=${WIN_COQ_DIR}/bin:$PATH
export COQBIN=${WIN_COQ_DIR}/bin/
WIN_COQLIB=`cygpath -m ${WIN_COQ_DIR}/lib/`

wget -nc http://ssr.msr-inria.inria.fr/FTP/ssreflect-${SSREFLECT_VER}.tar.gz
rm -rf ssreflect-${SSREFLECT_VER}
tar xf ssreflect-${SSREFLECT_VER}.tar.gz
cd ssreflect-${SSREFLECT_VER}
/usr/bin/make Makefile.coq
sed \
  -e "/^\$(call/a COQLIB=${WIN_COQLIB}" \
  -e 's/$(PP) -impl $</$(<:.ml4=.ml)/' \
  -i Makefile.coq
cp ../../ssreflect.ml ../../ssrmatching.ml src
/usr/bin/make
/usr/bin/make install
