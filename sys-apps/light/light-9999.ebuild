EAPI=6
inherit toolchain-funcs flag-o-matic

DESCRIPTION="light: GNU/Linux application to control backlight"
HOMEPAGE="http://haikarainen.github.io/light"
COMMIT="1ec60ac183cf1b04ff46897ad095ce7704225d80"
SRC_URI="https://github.com/haikarainen/${PN}/tarball/master -> ${PN}-${COMMIT}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}-master"

src_compile() {
	elog "dir: $(ls -la)"
	default
	elog "dir: $(ls -la)"
	append-lfs-flags
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} ${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}

src_install() {
	dobin light
}
