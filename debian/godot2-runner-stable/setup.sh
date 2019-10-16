#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-runner-stable
$root/bits/copyright.sh $root/workdir stable >$to/usr/share/doc/godot2-runner-stable/copyright

mkdir -p $to/usr/bin
cp $root/workdir/stable/bin/godot.x11.opt.32.llvm $to/usr/bin/godot2-runner-stable
