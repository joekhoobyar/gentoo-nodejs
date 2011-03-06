# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib

DESCRIPTION="Server side templating language for JavaScript"
HOMEPAGE="http://github.com/visionmedia/haml.js"
SRC_URI="http://github.com/visionmedia/haml.js/tarball/${PV} -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"
LICENSE="MIT"

S="${WORKDIR}/visionmedia-haml.js-${PV}-0-g3574abe"

DEPEND="net-libs/nodejs
		!dev-node/haml-js"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/lib/node
	doins lib/haml.js
	dodoc Readme.md History.md
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples || die
	fi
}
