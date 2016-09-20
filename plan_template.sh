#
# This package is NOT officially support by the Xorg project.  Please
# report bugs related to this package on GitHub:
#
# https://github.com/eeyun/habitat-plans
#
pkg_name=PKG_NAME
pkg_distname=PKG_NAME
pkg_origin=xorg
pkg_version=FIXME
pkg_dirname="${pkg_distname}-${pkg_version}"
pkg_maintainer="Ian Henry <ian@chef.io>"
pkg_description=FIXME
pkg_upstream_url="https://www.url.org/"
pkg_license=('MIT')
pkg_source="https://www.url.org/releases/current/src/everything/${pkg_distname}-${pkg_version}.tar.bz2"
pkg_shasum=FIXME
pkg_deps=(core/glibc)
pkg_build_deps=(core/gcc core/make)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)
pkg_bin_dirs=(bin)
