#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-editor-stable
$root/bits/copyright.sh $root/workdir stable >$to/usr/share/doc/godot2-editor-stable/copyright

mkdir -p $to/usr/bin
cp $root/workdir/stable/bin/godot.x11.opt.tools.32.llvm $to/usr/bin/godot2-stable

mkdir -p $to/usr/share/man/man6
gzip -c -9 $root/workdir/stable/misc/dist/linux/godot.6 >$to/usr/share/man/man6/godot2-stable.6.gz

mkdir -p $to/usr/share/pixmaps
cp $root/bits/godot2-stable.xpm $to/usr/share/pixmaps

mkdir -p $to/usr/share/applications
cp $root/bits/godot2-stable.desktop $to/usr/share/applications
