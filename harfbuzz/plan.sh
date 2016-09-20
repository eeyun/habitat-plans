pkg_name=harfbuzz
pkg_origin=odin
pkg_version=1.3.1
pkg_maintainer="Ian Henry <ian@chef.io>"
pkg_license=('mit')
pkg_source=http://www.freedesktop.org/software/harfbuzz/release/${pkg_name}-${pkg_version}.tar.bz2
pkg_shasum=a242206dd119d5e6cc1b2253c116abbae03f9d930cb60b515fb0d248decf89a1
pkg_deps=(
  odin/glib
  core/freetype
  core/fontconfig
  core/busybox
  odin/cairo
  core/expat
  core/glibc
  core/icu
)
pkg_build_deps=(
  core/gcc
  core/pkg-config
  core/make
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  PKG_CONFIG_PATH="$(pkg_path_for core/fontconfig)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(hab pkg path odin/glib)/lib/pkgconfig"
  export PKG_CONFIG_PATH

  export FREETYPE_LIBS="-L$(pkg_path_for core/freetype)/lib -lfreetype"
  export FREETYPE_CFLAGS="-I$(pkg_path_for core/freetype)/include/freetype2"
  export CAIRO_LIBS="-L$(pkg_path_for odin/cairo)/lib"
  export CAIRO_CFLAGS="-I$(pkg_path_for odin/cairo)/include/cairo"
  export CAIRO_FT_LIBS="-L$(pkg_path_for odin/cairo)/lib -lcairo"
  export CAIRO_FT_CFLAGS="-I$(pkg_path_for odin/cairo)/include/cairo"
  export GLIB_LIBS="-L$(pkg_path_for odin/glib)/lib -lglib-2.0"
  export GLIB_CFLAGS="-I$(pkg_path_for odin/glib)/include/glib-2.0 -I$(pkg_path_for odin/glib)/lib/glib-2.0/include"
  export FONTCONFIG_LIBS="-L$(pkg_path_for core/fontconfig)/lib -lfontconfig"
  export FONTCONFIG_CFLAGS="-I$(pkg_path_for core/fontconfig)/include"

  ./configure \
  --prefix=$pkg_prefix

  make
}

do_install() {
  make install
}
