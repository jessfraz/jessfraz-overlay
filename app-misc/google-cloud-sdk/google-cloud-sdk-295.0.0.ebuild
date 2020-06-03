# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

# This has to go after PYTHON_COMPAT!
inherit python-single-r1 bash-completion-r1

PYTHON_REQ_USE="sqlite"

DESCRIPTION="Command-line interface for Google Cloud Platform products and services"
HOMEPAGE="https://cloud.google.com/sdk"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${PN}-${PV}-linux-x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="$(python_gen_impl_dep 'sqlite(+)')"

S="${WORKDIR}/${PN}"

src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}

src_install() {
	dodir "/usr/share/${PN}"
	cp -R "${S}/" "${D}usr/share/" || die "Install failed!"

	# Symlink binary
	dosym "../../usr/share/${PN}/bin/gcloud" /usr/bin/gcloud
	dosym "../../usr/share/${PN}/bin/gsutil" /usr/bin/gsutil
	dosym "../../usr/share/${PN}/bin/bq" /usr/bin/bq

	# Install bash completion
	newbashcomp "${D}usr/share/${PN}/completion.bash.inc" gcloud
	bashcomp_alias gcloud gsutil bq
}
