# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="sqlite"

inherit bash-completion-r1

DESCRIPTION="Command-line interface for Google Cloud Platform products and services"
HOMEPAGE="https://cloud.google.com/sdk"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${PN}-${PV}-linux-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-db/sqlite:3"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
}

src_install() {
	cp -R "${S}/" "${D}/usr/share/" || die "Install failed!"
	dodir /usr/share/google-cloud-sdk

	# Symlink binary
	dosym ../../usr/share/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
	dosym ../../usr/share/google-cloud-sdk/bin/gsutil /usr/bin/gsutil
	dosym ../../usr/share/google-cloud-sdk/bin/bq /usr/bin/bq

	# Install bash completion
	newbashcomp "${D}"/usr/share/google-cloud-sdk/completion.bash.inc gcloud
	bashcomp_alias gcloud gsutil bq
}
