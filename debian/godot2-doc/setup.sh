#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-doc
cp -r $root/workdir/godot-docs/_build/html $to/usr/share/doc/godot2-doc

mkdir -p $to/usr/share/doc-base
cp $from/doc-base $to/usr/share/doc-base/godot2
