pkg_origin=odin
pkg_name=pango
pkg_version=1.38.1
pkg_maintainer="Ian Henry <ihenry@chef.io>"
pkg_license=('mit')
pkg_source=http://ftp.gnome.org/pub/gnome/sources/${pkg_name}/1.38/${pkg_name}-${pkg_version}.tar.xz
pkg_shasum=1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7
pkg_deps=(
    core/glibc
    core/busybox
    odin/glib
    odin/harfbuzz
    odin/cairo
    core/freetype
    core/fontconfig
    ssd/pixman
    core/bzip2
    core/zlib
    core/libpng
    core/pcre
)
pkg_build_deps=(
    core/coreutils
    core/diffutils
    core/patch
    core/gcc
    core/make
    core/pkg-config
    core/util-linux
    core/expat
    core/libffi
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_dirname=pango-${pkg_version}

pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
  PKG_CONFIG_PATH="$(pkg_path_for pixman)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/libpng)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/fontconfig)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/freetype)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/zlib)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/pcre)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/expat)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/glibc)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for odin/cairo)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for odin/harfbuzz)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for odin/glib)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/bzip2)/lib/pkgconfig"
  export PKG_CONFIG_PATH

  ./configure \
  --prefix=$pkg_prefix

  make
}

do_install() {
  make install
}


http://forthebadge.com/images/badges/built-with-love.svg
