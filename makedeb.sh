#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "Usage: $0 file.deb"
    echo "result will be put in gen/"
    exit 1
fi

for package in $@; do
    TMPDIR=$(mktemp -d)
    mkdir $TMPDIR/DEBIAN
    dpkg -e ${package}_*.deb $TMPDIR/DEBIAN
    cp -ar test-${package}/* $TMPDIR

    for file in $(ls $TMPDIR/{bin,usr/bin,sbin}/*.out 2>/dev/null); do
        echo mv $file ${file/.out/}
        mv $file ${file/.out/}
    done

    pushd $TMPDIR

    rm DEBIAN/md5sums
    find -type f | sed 's/^\.\///' | grep -v '^DEBIAN' | xargs -n 100 md5sum > DEBIAN/md5sums

    popd

    mkdir -p gen
    dpkg -b $TMPDIR gen
    echo generated gen/${package}_*.deb

    rm -rf $TMPDIR
done
