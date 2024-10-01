#!/bin/bash
set -e

if [ "x$INPUT_INSTALL" != "x" ]; then
    echo "Installing polyfill-glibc to $GITHUB_PATH"
    echo $(find $(pwd) -name 'polyfill-glibc' -printf "%h\n" | sort -u) >> $GITHUB_PATH
fi

if [ "x$INPUT_TARGET" != "x" ] && [ "x$INPUT_GLIBC" != "x" ]; then
    if [ "x$INPUT_TARGET" != "x" ]; then
        echo "Running polyfill-glibc with target $INPUT_TARGET"
        name=$(sh -c "polyfill-glibc --target-glibc=$INPUT_GLIBC $INPUT_TARGET || echo $INPUT_TARGET")
    fi
    if [ "x$name" == "x" ]; then
        exit 1
    fi
    echo "binary=$name" >> $GITHUB_OUTPUT
else
    sh -c "$@"
fi
