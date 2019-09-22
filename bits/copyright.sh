#! /bin/sh
set -e

[ $# -eq 2 ]

cd $1

sed 's/^/# /' godot/LICENSE.txt
echo

if [ "$2" = "frt" ]
then
	sed 's/^/# /' godot/platform/frt/LICENSE.txt
	echo
fi

cat godot/COPYRIGHT.txt
