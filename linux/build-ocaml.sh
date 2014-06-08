#!/bin/sh
set -ve

. ../conf.sh
PREFIX=`pwd`
export PATH=${PREFIX}/bin:$PATH

# patches
[ -e "0007-Fix-ocamlopt-w.r.t.-binutils-2.21.patch" ] || \
  wget -O "0007-Fix-ocamlopt-w.r.t.-binutils-2.21.patch" \
       'http://caml.inria.fr/mantis/file_download.php?file_id=418&type=bug'

wget -nc http://caml.inria.fr/pub/distrib/ocaml-3.11/ocaml-${OCAML_VER}.tar.bz2
rm -rf ocaml-${OCAML_VER}
tar xf ocaml-${OCAML_VER}.tar.bz2
cd ocaml-${OCAML_VER}

# patches
patch -p1 < "../0007-Fix-ocamlopt-w.r.t.-binutils-2.21.patch"

# ./configure -prefix ${PREFIX} -no-tk \
#   -cc "gcc -m32" -as "as --32" -aspp "gcc -m32 -c" \
#   -host i386-pc-linux
./configure -prefix ${PREFIX}
make world.opt > log.world 2>&1
# make world > log.world 2>&1
make install > log.install 2>&1
