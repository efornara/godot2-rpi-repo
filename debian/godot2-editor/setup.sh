#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-editor
$root/bits/copyright.sh $root/workdir dev >$to/usr/share/doc/godot2-editor/copyright

mkdir -p $to/usr/bin
cp $root/workdir/godot/bin/godot.x11.opt.tools.32.llvm $to/usr/bin/godot2

mkdir -p $to/usr/share/man/man6
gzip -c -9 $root/workdir/godot/misc/dist/linux/godot.6 >$to/usr/share/man/man6/godot2.6.gz

mkdir -p $to/usr/share/pixmaps
cp $root/bits/godot2.xpm $to/usr/share/pixmaps

mkdir -p $to/usr/share/applications
cp $root/bits/godot2.desktop $to/usr/share/applications
