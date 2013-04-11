#!/bin/bash

NAME=lua
VERSION=5.2.2
FULLNAME=$NAME-$VERSION

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

    git diff $oldest..$newest >patches/$FULLNAME-$name.patch
}

mkdir -p $PATCH_DIR
make_patch autotoolize 28dc5b5^ 13f2022
make_patch idsize      1a7fb69
