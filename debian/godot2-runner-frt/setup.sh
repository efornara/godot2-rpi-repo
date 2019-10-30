#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-runner-frt
$root/bits/copyright.sh $root/workdir frt >$to/usr/share/doc/godot2-runner-frt/copyright

mkdir -p $to/usr/bin
cp $root/workdir/godot/bin/godot.frt.opt.llvm $to/usr/bin/godot2-runner-frt
