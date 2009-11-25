# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/brasero/brasero-2.26.3.ebuild,v 1.1 2009/07/07 16:48:15 mrpouet Exp $

EAPI="2"
GCONF_DEBUG="no"

inherit eutils gnome2 gnome2-la

DESCRIPTION="Brasero (aka Bonfire) is yet another application to burn CD/DVD for the gnome desktop."
HOMEPAGE="http://www.gnome.org/projects/brasero"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="beagle +cdr +css +libburn +totem +nautilus"

COMMON_DEPEND=">=dev-libs/glib-2.16.5
	>=x11-libs/gtk+-2.16.0
	>=media-libs/gstreamer-0.10.15
	>=media-libs/gst-plugins-base-0.10.15
	>=media-plugins/gst-plugins-ffmpeg-0.10
	>=dev-libs/libxml2-2.6
	>=dev-libs/libunique-1
	gnome-base/gconf
	>=app-cdr/cdrdao-1.2.2-r3
	>=app-cdr/dvd+rw-tools-7.1
	>=dev-libs/dbus-glib-0.72
	cdr? ( virtual/cdrtools )
	totem? ( >=dev-libs/totem-pl-parser-2.22 )
	beagle? ( >=dev-libs/libbeagle-0.3.0 )
	libburn? ( >=dev-libs/libburn-0.6.0
		>=dev-libs/libisofs-0.6.12 )
	nautilus? ( >=gnome-base/nautilus-2.24.2 )"
RDEPEND="${COMMON_DEPEND}
	gnome-base/gvfs
	media-plugins/gst-plugins-meta
	css? ( media-libs/libdvdcss )"
DEPEND="${COMMON_DEPEND}
	app-text/gnome-doc-utils
	dev-util/pkgconfig
	sys-devel/gettext
	dev-util/intltool"
# eautoreconf deps
#	gnome-base/gnome-common

pkg_setup() {
	# Pointless .la files for plugins
	G2PUNT_LA="yes"

	G2CONF="${G2CONF}
		--disable-schemas-install
		--disable-scrollkeeper
		--disable-caches
		--disable-dependency-tracking
		$(use_enable cdr cdrtools)
		$(use_enable cdr cdrkit)
		$(use_enable nautilus)
		$(use_enable totem playlist)
		$(use_enable beagle search)
		$(use_enable libburn libburnia)"

	DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"
}

pkg_postinst() {
	gnome2_pkg_postinst
	elog
	elog "If ${PN} doesn't handle some music or video format, please check"
	elog "your USE flags on media-plugins/gst-plugins-meta"

	if ! use cdr && ! use libburn; then
		elog
		ewarn "You have disabled all burning backends for Brasero"
		ewarn "Brasero can now do nothing at all. Probably not what you want."
	fi
}
