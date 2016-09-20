pkg_origin=odin
pkg_name=libossp-uuid
pkg_version=1.6.2
pkg_maintainer="Ian Henry <ihenry@chef.io>"
pkg_license=('mit')
pkg_source=http://www.mirrorservice.org/sites/ftp.ossp.org/pkg/lib/uuid/uuid-${pkg_version}.tar.gz
pkg_dirname=uuid-1.6.2
pkg_shasum=11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0
pkg_deps=(core/glibc)
pkg_build_deps=(core/coreutils core/gcc core/make)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
    ./configure \
      --prefix=$pkg_prefix \
      --sbindir=$pkg_prefix/bin
  make
}

do_install() {
  make install
}