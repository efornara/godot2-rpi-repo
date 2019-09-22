#! /bin/sh
set -e

die() {
	echo $1
	exit 1
}

copy_file() {
	[ -f debian/$package/$1 ] || return 0
	mkdir -p $base/$2
	cp debian/$package/$1 $base/$2
}

fix_control_file() {
	size=`du -d 0 -k $base | cut -f 1`
	cat >>$base/DEBIAN/control <<END
Package: $package
Maintainer: Emanuele Fornara <efornara@users.sourceforge.net>
Section: devel
Priority: optional
Installed-Size: $size
END
}

[ -x build.sh ] || die "Please run from project root directory."

[ $# -eq 1 ] || die "usage: build.sh package"

package=$1
control=debian/$package/control

[ -f $control ] || die "Package $package invalid."

base=workdir/tmp
rm -rf $base ; mkdir -p $base

copy_file control DEBIAN
copy_file postinst DEBIAN
copy_file prerm DEBIAN
copy_file copyright usr/share/doc/$package
copy_file README usr/share/doc/$package

if [ -x debian/$package/setup.sh ] ; then
	debian/$package/setup.sh debian/$package $base
fi

fix_control_file

# ( cd $base ; find . ) ; exit 0

version=`grep "^Version:" $control | cut -d " " -f 2 -`
arch=`grep "^Architecture:" $control | cut -d " " -f 2 -`

mkdir -p spool
fakeroot dpkg -b $base spool/${package}_${version}_${arch}.deb

rm -rf $base
