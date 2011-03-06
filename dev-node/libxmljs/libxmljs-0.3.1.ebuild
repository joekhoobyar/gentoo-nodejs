# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"

DESCRIPTION="libxml bindings for v8 javascript engine"
HOMEPAGE="http://libxmljs.squishtech.com/"
SRC_URI="http://github.com/polotek/libxmljs/tarball/${PV} -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* x86 amd64"
IUSE=""

RDEPEND="net-libs/nodejs dev-libs/libxml2"
DEPEND="${RDEPEND} dev-util/scons"

S="${WORKDIR}/polotek-libxmljs-3be1980"

src_install() {
	insinto /usr/lib/node
	doins "${PN}.node" || die
	dodoc README.md CHANGELOG LICENSE || die
}
