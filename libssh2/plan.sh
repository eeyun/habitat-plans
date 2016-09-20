pkg_origin=odin
pkg_name=libssh2
pkg_version=1.7.0
pkg_maintainer="Ian Henry <ian@chef.io>"
pkg_license=('mit')
pkg_source=https://www.libssh2.org/download/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584
pkg_deps=(
    core/zlib
    core/openssl
)
pkg_build_deps=(
    core/coreutils 
    core/make 
    core/gcc 
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
    ./configure \
      --prefix=$pkg_prefix
      
    make
}

do_check() {
    make check
}

do_install() {
    make install
}