# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="2"

inherit git
inherit eutils

# omgwtf
RESTRICT="test"

DESCRIPTION="Evented IO for V8 Javascript"
HOMEPAGE="http://nodejs.org/"
EGIT_REPO_URI="git://github.com/ry/node.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""

DEPEND=">=dev-lang/v8-2.5.9.6-r1
	dev-libs/openssl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/node-v${PV}

src_configure() {
	# this is a waf confuserator
	./configure --shared-v8 --prefix=/usr || die
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	keepdir /usr/lib/node
	newenvd "${FILESDIR}/90nodejs-envd" "90nodejs"
}

src_test() {
	emake test || die
}
