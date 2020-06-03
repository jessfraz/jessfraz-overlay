# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=2

DESCRIPTION="JessOS desktop (meta package)"
HOMEPAGE="http://jess.dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-crypt/pinentry
	app-pda/libimobiledevice
	jessos/base
	net-wireless/iwd
	sys-apps/usbutils
"
