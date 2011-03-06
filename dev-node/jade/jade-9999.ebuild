# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib git

DESCRIPTION="Jade - robust, incredibly feature rich template engine for nodejs"
HOMEPAGE="http://jade-lang.com"
EGIT_REPO_URI="git://github.com/visionmedia/jade.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE="examples"

DEPEND="net-libs/nodejs
		dev-node/coffee-script
		dev-node/sass
		dev-node/expresso
		dev-node/markdown-js"
RDEPEND="${DEPEND}"

src_compile() {
	einfo "Not running the tests, as they are broken..."
}

src_install() {
	newbin bin/jade jade.js
	insinto /usr/lib/node/jade
	doins -r \
		lib/{compiler.js,doctypes.js,filters.js,jade.js,lexer.js,nodes,parser.js,self-closing.js,utils.js}
	dosym jade.js /usr/lib/node/jade/index.js
	dodoc Readme.md History.md LICENSE api.html
	if use examples; then
		insinto "/usr/share/${PN}"
		doins -r examples
	fi
}
