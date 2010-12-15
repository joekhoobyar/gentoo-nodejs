# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git multilib

DESCRIPTION="Server side templating language for JavaScript"
HOMEPAGE="http://github.com/visionmedia/haml.js"
EGIT_REPO_URI="git://github.com/visionmedia/haml.js.git"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"
LICENSE="MIT"

DEPEND="dev-lang/nodejs
		!dev-node/haml-js"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	doins lib/haml.js
	dodoc Readme.md History.md
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples || die
	fi
}
