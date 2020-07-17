# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs autotools flag-o-matic

DESCRIPTION="light: GNU/Linux application to control backlight"
HOMEPAGE="http://haikarainen.github.io/${PN}"
SRC_URI="https://github.com/haikarainen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="udev"

RDEPEND="udev? ( virtual/udev )"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf $(use_with udev)
}

src_compile() {
	append-lfs-flags
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} ${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}
