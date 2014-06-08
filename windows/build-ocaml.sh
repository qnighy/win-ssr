#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
WIN_PREFIX=`cygpath -m $PREFIX`
export PATH=${PREFIX}/bin:$PATH

wget -nc http://caml.inria.fr/pub/distrib/ocaml-3.11/ocaml-${OCAML_VER}.tar.bz2
rm -rf ocaml-${OCAML_VER}
tar xf ocaml-${OCAML_VER}.tar.bz2
cd ocaml-${OCAML_VER}

sed \
  -e 's/\bas\b/i686-w64-mingw32-as/g' \
  -e 's/\bgcc\b/i686-w64-mingw32-gcc/g' \
  -e 's/-mno-cygwin//g' \
  -e 's/\bar\b/i686-w64-mingw32-ar/g' \
  -e 's/\bld\b/i686-w64-mingw32-ld/g' \
  -e 's/\branlib\b/i686-w64-mingw32-ranlib/g' \
  -e 's/\blabltk\b//g' \
  -e "s|PREFIX=.*|PREFIX=${WIN_PREFIX}|" \
  < config/Makefile.mingw > config/Makefile
cp config/s-nt.h config/s.h
cp config/m-nt.h config/m.h

sed -e 's/\bwindres\b/i686-w64-mingw32-windres/' -i win32caml/Makefile

make -f Makefile.nt world > log.world 2>&1
make -f Makefile.nt bootstrap > log.bootstrap 2>&1
make -f Makefile.nt opt > log.opt 2>&1
make -f Makefile.nt opt.opt > log.opt.opt 2>&1
make -f Makefile.nt install > log.install 2>&1
