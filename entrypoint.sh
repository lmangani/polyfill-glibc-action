#!/bin/sh -l

if [ "x$INPUT_TARGET" != "x" ] && [ "x$INPUT_GLIBC" != "x" ]; then
    if [ "x$INPUT_TARGET" != "x" ]; then
        cp $INPUT_TARGET /tmp/$INPUT_TARGET
        name=$(sudo sh -c "polyfill-glibc --target-glibc=$INPUT_GLIBC $INPUT_TARGET || echo $INPUT_TARGET")
    fi
    if [ "x$name" == "x" ]; then
        exit 1
    fi
    echo "::set-output name=binary::$name"
else
    sh -c "$@"
fi