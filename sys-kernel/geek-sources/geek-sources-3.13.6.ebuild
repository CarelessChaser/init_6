# Copyright 2009-2014 Andrey Ovcharov <sudormrfhalt@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
DEBLOB_AVAILABLE="1"

KMV="$(echo $PV | cut -f 1-2 -d .)"
KSV="$(echo $PV | cut -f 1-3 -d .)"

# AUFS_VER="3.x-rcN"
BFQ_VER="3.13.0-v7r2"
BLD_VER="3.13-rc1"
CK_VER="3.13-ck1"
FEDORA_VER="f20"
GRSEC_VER="3.0-${KSV}-201403172032" # 17/03/14 20:32
GRSEC_SRC="http://grsecurity.net/test/grsecurity-${GRSEC_VER}.patch"
ICE_VER="for-linux-3.13.5-2014-03-05"
LQX_VER="3.13.5-1" # LQX_VER="${KSV}-1"
MAGEIA_VER="releases/${KSV}/1.mga5"
# PAX_VER="${KSV}-test11"
# PAX_SRC="http://www.grsecurity.net/~paxguy1/pax-linux-${PAX_VER}.patch"
REISER4_VER="3.13.6"
# RT_VER="3.12.6-rt9"
UKSM_VER="0.1.2.2"
UKSM_NAME="uksm-${UKSM_VER}-for-v3.13"

SUPPORTED_USES="aufs bfq bld brand -build ck -deblob exfat fedora gentoo grsec hardened ice lqx mageia openwrt optimize pf reiser4 suse symlink uksm zen zfs"

inherit geek-sources

HOMEPAGE="https://github.com/init6/init_6/wiki/${PN}"
KEYWORDS="amd64 x86"

DESCRIPTION="Full sources for the Linux kernel including: fedora, grsecurity, mageia and other patches"
