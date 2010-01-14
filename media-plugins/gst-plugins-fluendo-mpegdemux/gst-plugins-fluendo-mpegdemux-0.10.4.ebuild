# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN=gst-fluendo-mpegdemux
MY_P=${MY_PN}-${PV}
SRC_URI="http://core.fluendo.com/gstreamer/src/${MY_PN}/${MY_P}.tar.bz2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DESCRIPTION="Fluendo's Mpeg demuxer is a GStreamer element to demux mpeg streams"
HOMEPAGE="http://www.fluendo.com"
LICENSE="MPL-1.1"
SLOT=0.10

S=${WORKDIR}/${MY_P}
RDEPEND=">=media-libs/gstreamer-0.10.4
	 >=media-libs/gst-plugins-base-0.10.4"

DEPEND="${RDEPEND}"

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS README RELEASE INSTALL REQUIREMENTS
}
