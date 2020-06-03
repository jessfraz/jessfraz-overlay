# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=2

DESCRIPTION="JessOS dev (meta package)"
HOMEPAGE="http://jess.dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-emulation/docker
	app-misc/google-cloud-sdk
	dev-lang/go
	dev-lang/python[sqlite]
	dev-lang/R
	dev-lang/rust[clippy(+),nightly(+),rls(+),rustfmt(+)]
	net-libs/nodejs[npm(+)]
"
