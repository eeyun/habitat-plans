pkg_origin=odin
pkg_name=guacamole-server
pkg_version=0.9.9
pkg_maintainer="Ian Henry <ihenry@chef.io>"
pkg_license=('mit')
pkg_source=http://sourceforge.net/projects/guacamole/files/current/source/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=4263e78c7f7c6fe04bd4bbe96634aa612ae67e4ce64fdc4feb8d16ce70e724ff
pkg_deps=(
    core/libjpeg-turbo
    core/libpng
    core/openssh
    odin/cairo
    odin/glib/2.48.2/20160916013238
    odin/libssh2
    odin/libossp-uuid
    core/fontconfig
    core/openssl
    core/bzip2
    core/zlib
    core/busybox
)
pkg_build_deps=(
    odin/pango
    core/coreutils
    core/pkg-config
    core/make
    core/gcc
    core/util-linux
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_expose=(4822)

pkg_svc_user="root"
pkg_svc_group="root"

do_build() {
    PKG_CONFIG_PATH="$(pkg_path_for odin/pango)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/pango)/lib/pkgconfig"
    #PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/glib/2.48.2/20160916013238)/lib/pkgconfig"
    #PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/pango/1.28.3/20160916030128)/lib/pkgconfig"
    #PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/cairo)/lib/pkgconfig"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(pkg_path_for odin/libssh2)/lib/pkgconfig"
    export PKG_CONFIG_PATH
    #
    #export PANGO_LIBS="-L$(pkg_path_for odin/pango/1.28.3/20160916030128)/lib"
    #export PANGO_CFLAGS="-I$(hab pkg path odin/pango/1.28.3/20160916030128)/include/pango-1.0/pango"
    #export PANGOCAIRO_LIBS="-L$(pkg_path_for odin/pango/1.28.3/20160916030128)/lib"
    #export PANGOCAIRO_CFLAGS="-I$(hab pkg path odin/pango/1.28.3/20160916030128)/include/pango-1.0"

    #CPPFLAGS="${CPPFLAGS} -I$(pkg_path_for odin/cairo)/include/cairo -I$(pkg_path_for odin/glib/2.48.2/20160916013238)/include/glib-2.0 -I$(pkg_path_for odin/glib/2.48.2/20160916013238)/include -I$(pkg_path_for odin/glib/2.48.2/20160916013238)/lib/glib-2.0/include"
    #export CPP_FLAGS
    attach
    ./configure \
      --prefix=${pkg_prefix} \
      --bindir=${pkg_prefix}/bin

    make -Wno-error=pedantic
    ldconfig
}

do_install() {
    make install
}
