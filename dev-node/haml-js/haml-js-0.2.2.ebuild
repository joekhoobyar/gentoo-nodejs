# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="Server side templating language for JavaScript"
HOMEPAGE="http://github.com/creationix/haml-js"
SRC_URI="http://github.com/creationix/${PN}/tarball/v${PV} -> ${PN}-${PV}.tar.gz"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
S="${WORKDIR}/creationix-haml-js-8ea2df3"
LICENSE="MIT"

EAPI=2

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	newins lib/haml.js haml-js.js
	dodoc README.markdown LICENSE
}
