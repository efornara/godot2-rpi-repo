#! /bin/sh
set -e

[ $# -eq 2 ]

cd $1

if [ "$2" = "stable" ]
then
	base=stable
else
	base=godot
fi

sed 's/^/# /' $base/LICENSE.txt
echo

if [ "$2" = "frt" ]
then
	sed 's/^/# /' $base/platform/frt/LICENSE.txt
	echo
fi

cat $base/COPYRIGHT.txt
