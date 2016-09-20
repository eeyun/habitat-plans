pkg_origin=odin
pkg_name=cairo
pkg_version=1.14.6
pkg_maintainer="Ian Henry <ihenry@chef.io>"
pkg_license=("LGPL-2.1")
pkg_description="hack copy of steven danna's package ssd/cairo"
pkg_source="https://cairographics.org/releases/cairo-${pkg_version}.tar.xz"
pkg_shasum=613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252
pkg_deps=(core/glibc core/libpng core/zlib core/pixman core/freetype core/fontconfig odin/glib xorg/xlib xorg/xproto xorg/libxext xorg/xextproto)
pkg_build_deps=(core/gcc core/make core/pkg-config core/autoconf core/diffutils core/expat)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
    PKG_CONFIG_PATH="$(pkg_path_for core/libpng)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for core/zlib)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/glib)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for core/libpng)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for core/pixman)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for xorg/xlib)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for xorg/xproto)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for xorg/libxext)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for xorg/xextproto)/lib/pkgconfig"
    export PKG_CONFIG_PATH

    export FREETYPE_LIBS="-L$(pkg_path_for core/freetype)/lib -lfreetype"
    export FREETYPE_CFLAGS="-I$(pkg_path_for core/freetype)/include/freetype2"
    export FONTCONFIG_LIBS="-L$(pkg_path_for core/fontconfig)/lib -lfontconfig"
    export FONTCONFIG_CFLAGS="-I$(pkg_path_for core/fontconfig)/include"

    CFLAGS="${CFLAGS} -O"
    ./configure --prefix=$pkg_prefix

    make
}

do_check() {
    make check
}
