# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1 eutils

DESCRIPTION="A Portage analysis toolkit"
HOMEPAGE="http://catmur.co.uk/gentoo/udept"
SRC_URI="http://files.catmur.co.uk/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~mips ~sparc ~x86"
IUSE=""

DEPEND="app-shells/bash
	sys-apps/portage"
RDEPEND="${DEPEND}"

BASH_COMPLETION_NAME="dep"

src_unpack() {
	unpack ${A}
	cd "${S}"
#	epatch "${FILESDIR}/udept.default-use.patch"
}

src_compile() {
	econf $(use_enable bash-completion) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc ChangeLog*
}
