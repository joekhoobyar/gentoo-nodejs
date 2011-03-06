# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib git

DESCRIPTION="A Markdown parser for javascript"
HOMEPAGE="https://github.com/evilstreak/markdown-js"
EGIT_REPO_URI="git://github.com/evilstreak/markdown-js.git"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
LICENSE="MIT"

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/lib/node
	doins lib/markdown.js
	dodoc README.markdown
}
