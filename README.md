# Build Windows binary of Ssreflect

This script is for building ssreflect binary, which is **compatible to the Official Coq binary for Windows**.

# Requirements

A Linux environment with:

- GCC compiler and other build essentials

An Windows environment with:

- Cygwin
- mingw64-i686-gcc package and other basic build tools in Cygwin
- the current flexdll and its PATH specified
- the Official Coq binary on a path with no whitespaces (e.g. /cygdrive/c/coq-dist)

# Usage

## Step 1. ESP required compiler version

OCaml requires the exactly same version to acquire binary compatibility. You must find out what version of compiler was used to build the binary. Using file command on binaries (cmi, cma, cmx, cmxs, cmxa, ...) is helpful.

For example, coq-8.4pl3 and coq-8.4pl4 requires OCaml 3.11.2 and camlp5 6.02.1.

## Step 2. Configure

edit conf.sh to match your environment.

## Step 3. Compile Ssreflect AST on Linux

on your linux distribution, do the following:

```sh
$ cd linux
$ ./build-ocaml.sh
$ ./build-camlp5.sh
$ ./build-coq.sh
$ ./build-ssreflect.sh
```

When success, there will be ssreflect.ml and ssrmatching.ml on the top directory.

## Step 4. Copy AST into Windows

Copy the generated AST file to your Windows environment.

make sure that

```sh
$ ls
conf.sh  linux  README.md  ssreflect.ml  ssrmatching.ml  windows
```

## Step 5. Build ssreflect on Windows

Do the following on Windows:

```sh
$ cd windows
$ ./build-ocaml.sh
$ ./build-camlp5.sh
$ ./build-ssreflect.sh
$ ./build-mathcomp.sh # [this is optional]
```

Then ssreflect is built and installed to WIN\_COQ\_DIR specified in conf.sh.

