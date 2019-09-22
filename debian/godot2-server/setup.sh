#! /bin/sh
set -e

[ $# -eq 2 ] || exit 1
from=$1
to=$2
root=$from/../..

mkdir -p $to/usr/share/doc/godot2-server
$root/bits/copyright.sh $root/workdir std >$to/usr/share/doc/godot2-server/copyright

mkdir -p $to/usr/bin
cp $root/workdir/godot/bin/godot_server.server.opt.32 $to/usr/bin/godot2-server
