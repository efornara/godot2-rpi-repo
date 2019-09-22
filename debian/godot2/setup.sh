#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2
cp $root/workdir/godot/LICENSE.txt $to/usr/share/doc/godot2/copyright
