#! /bin/sh
set -e

die() {
	echo $1
	exit 1
}

usage() {
	die "usage: compile.sh editor|runner|server|headless|frt|editor-stable|runner-stable"
}

[ -x compile.sh ] || die "Please run from project root directory."
[ -f workdir/godot/README.md -o -f workdir/stable/README.md ] || die "No godot source."
[ $# -eq 1 ] || usage

# Theora is builtin in console applications because linking it would cause
# the package to be dependent on x11 (via cairo).

common_opts="\
	use_llvm=yes \
	use_lto=yes \
	builtin_zlib=no \
	builtin_freetype=no \
	builtin_libpng=no \
	builtin_libogg=no \
	builtin_libvorbis=no \
	builtin_opus=no \
	builtin_libglew=no \
	builtin_libwebp=no \
	builtin_openssl=no \
	"
ccflags_rpi="\
	-march=armv6 \
	-mfpu=vfp \
	-mfloat-abi=hard \
	"

export BUILD_REVISION=rpi

cd workdir
case $1 in
	editor)
		cd godot
		nice scons \
			platform=x11 \
			tools=yes \
			target=release_debug \
			$common_opts \
			builtin_libsquish=no \
			builtin_libtheora=no \
			pulseaudio=no \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot.x11.opt.tools.32.llvm
		;;
	runner)
		cd godot
		nice scons \
			platform=x11 \
			tools=no \
			target=release \
			$common_opts \
			builtin_libtheora=no \
			pulseaudio=no \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot.x11.opt.32.llvm
		;;
	server)
		cd godot
		nice scons \
			platform=server \
			tools=no \
			target=release \
			$common_opts \
			builtin_libtheora=yes \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot_server.server.opt.32
		;;
	headless)
		cd godot
		nice scons \
			platform=server \
			tools=yes \
			target=release_debug \
			$common_opts \
			builtin_libtheora=yes \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot_server.server.opt.tools.32
		;;
	frt)
		cd godot
		[ -f platform/frt/README.md ] || die "No frt source."
		nice scons \
			platform=frt \
			target=release \
			$common_opts \
			builtin_libtheora=yes \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot.frt.opt.llvm
		;;
	editor-stable)
		cd stable
		nice scons \
			platform=x11 \
			tools=yes \
			target=release_debug \
			$common_opts \
			builtin_libsquish=no \
			builtin_libtheora=no \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot.x11.opt.tools.32.llvm
		;;
	runner-stable)
		cd stable
		nice scons \
			platform=x11 \
			tools=no \
			target=release \
			$common_opts \
			builtin_libtheora=no \
			CCFLAGS="$ccflags_rpi" \
			-j 4
		strip bin/godot.x11.opt.32.llvm
		;;
	*) usage
esac
