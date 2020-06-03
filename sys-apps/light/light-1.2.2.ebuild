# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit toolchain-funcs autotools flag-o-matic

DESCRIPTION="light: GNU/Linux application to control backlight"
HOMEPAGE="http://haikarainen.github.io/light"
SRC_URI="https://github.com/haikarainen/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}-${PV}"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}

src_configure() {
	./autogen.sh
	econf
}

src_compile() {
	default
	append-lfs-flags
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} ${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}

src_install() {
	dobin src/light

	doman light.1
}
