pkg_origin=odin
pkg_name=glib
pkg_version=2.48.2
pkg_maintainer="Ian Henry <ihenry@chef.io>"
pkg_license=('mit')
pkg_source=http://ftp.gnome.org/pub/gnome/sources/${pkg_name}/2.48/${pkg_name}-${pkg_version}.tar.xz
pkg_shasum=f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_dirname=${pkg_name}-${pkg_version}
pkg_svc_user="root"
pkg_svc_group="root"
pkg_deps=(
    core/glibc
    core/zlib
    core/busybox
    core/perl
    core/python2
    core/pcre
    core/libffi
)
pkg_build_deps=(
    core/make
    core/pkg-config
    core/gcc
    core/gettext
    core/util-linux
)


do_build() {
  PKG_CONFIG_PATH="$(pkg_path_for core/libffi)/lib/pkgconfig"
  PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pkg_path_for core/pcre)/lib/pkgconfig"
  export PKG_CONFIG_PATH
  attach
  ./configure \
  --prefix=$pkg_prefix

  echo "Symlinking busybox/bin/env to /usr/bin/env"
  ln -sf $(pkg_path_for busybox)/bin/env /usr/bin/env

  make
}

do_install() {
  make install
}
