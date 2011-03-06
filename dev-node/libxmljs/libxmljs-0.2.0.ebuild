# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="libxml bindings for v8 javascript engine"
HOMEPAGE="http://libxmljs.squishtech.com/"
SRC_URI="http://github.com/polotek/libxmljs/tarball/v${PV} -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

RDEPEND="net-libs/nodejs dev-libs/libxml2"
DEPEND="${RDEPEND} dev-util/scons"

src_compile () {
	node-waf configure || die "Configure failed"
	node-waf build || die "Compilation failed"
}

src_install() {
	insinto /usr/$(get_libdir)/node
	doins "${PN}.node" || die
	dodoc README.md CHANGELOG LICENSE || die
}
