# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git multilib

DESCRIPTION="Server side templating language for JavaScript"
HOMEPAGE="http://github.com/creationix/haml-js"
EGIT_REPO_URI="git://github.com/creationix/haml-js.git"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
LICENSE="MIT"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	newins lib/haml.js haml-js.js
	dodoc README.markdown LICENSE
}
