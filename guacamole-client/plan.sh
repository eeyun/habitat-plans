pkg_name=guacamole-client
pkg_origin=odin
pkg_version=0.9.9
pkg_maintainer="Ian Henry <ian@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=http://sourceforge.net/projects/guacamole/files/current/source/${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=dd79f3f56cda52048c472594830367d1274f0f648ac0b3ec5a532b379430cd40
pkg_deps=(
    core/glibc
    core/tomcat8
    core/mysql
    core/jdk8
    odin/guacamole-server/0.9.9/20160916140622
    odin/libssh2
    core/openssh
    core/busybox
)
pkg_build_deps=(
    core/maven
    core/coreutils
    core/make
    core/gcc
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_exposes=(8080)

pkg_svc_user="root"
pkg_svc_group="root"


do_build() {
    export JAVA_HOME=$(hab pkg path core/jdk8)
    mvn package
}

do_install() {
    cp $HAB_CACHE_SRC_PATH/${pkg_dirname}/guacamole/target/guacamole-${pkg_version}.war $pkg_prefix
}
