# Copyright 2009-2014 Andrey Ovcharov <sudormrfhalt@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
DEBLOB_AVAILABLE="1"

KMV="$(echo $PV | cut -f 1-2 -d .)"
KSV="$(echo $PV | cut -f 1-3 -d .)"

BFQ_VER="${KSV}"
ICE_VER="3.2-for-2.6.34"
# PAX_VER="2.6.34.7-test20"
REISER4_VER="${KSV}"
REISER4_SRC="mirror://sourceforge/project/reiser4/reiser4-for-linux-2.6/reiser4-for-${REISER4_VER}.patch.gz"
SUSE_VER="7a744773dd7c2539b7757435d0108cb701dd0165" # rpm-2.6.34-12
UKSM_VER="0.1.2.2"
UKSM_NAME="uksm-${UKSM_VER}-for-v${KMV}.ge.40"

SUPPORTED_USES="bfq brand -build ice reiser4 suse symlink"

inherit geek-sources

HOMEPAGE="https://github.com/init6/init_6/wiki/${PN}"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Full sources for the Linux kernel including: fedora, grsecurity, mageia and other patches"
