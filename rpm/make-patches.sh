#!/bin/bash

PATCH_DIR=patches

make_patch() {
    local name=$1
    local oldest=$2^
    local newest=$2

    if test x"$3" != x; then
        # A third arg indicates we want a range
        oldest=$2
        newest=$3
    fi

    git diff $oldest..$newest >patches/$name
}

mkdir -p $PATCH_DIR
make_patch lua-5.1.4-autotoolize.patch b2782f2^ fac87d9
make_patch lua-5.1.4-lunatic.patch     cbbb1d1
make_patch lua-5.1.4-idsize.patch      62e6b83
make_patch lua-5.1.4-2.patch           a65f486
