# Copyright 2010 Gergan Penkoc 
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib git

DESCRIPTION="Embedded JavaScript templates for node - Express compliant"
HOMEPAGE="https://github.com/visionmedia/ejs"
EGIT_REPO_URI="https://github.com/visionmedia/ejs.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/makefile.patch
}

src_compile() {
	einfo "Not running the tests, as they are broken..."
}

src_install() {
	insinto /usr/$(get_libdir)/node/libraries
	doins -r lib/ejs
	dodoc Readme.md History.md
}
