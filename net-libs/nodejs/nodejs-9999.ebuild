# Copyright 2010 Ivan Boldyrev
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="Evented I/O framework for V8 javascript."
HOMEPAGE="http://nodejs.org/"
EGIT_REPO_URI="git://github.com/ry/node.git"

LICENSE="MIT LGPL"
SLOT="0"
KEYWORDS="-*"
IUSE="ssl"

RDEPEND="ssl? ( dev-libs/openssl )
	>=sys-devel/gcc-4"
DEPEND="${RDEPEND}"

src_compile() {
	./configure --prefix=/usr || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	./tools/waf-light install --destdir="${D}" || die "install failed"

	keepdir /usr/lib/node/libraries
	newenvd "${FILESDIR}/90nodejs-envd" "90nodejs"
}
