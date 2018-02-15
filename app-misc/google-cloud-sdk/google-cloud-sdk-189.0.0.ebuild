EAPI=6
inherit bash-completion-r1

DESCRIPTION="Command-line interface for Google Cloud Platform products and services"
HOMEPAGE="https://cloud.google.com/sdk"
SRC_URI="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${PN}-${PV}-linux-x86_64.tar.gz"

LICENSE="See https://cloud.google.com/terms/"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_install() {
	dodir ${ROOT}/usr/share/google-cloud-sdk
	cp -R "${S}/" "${D}/usr/share/" || die "Install failed!"

	# Symlink binary
	dosym ${D}/usr/share/google-cloud-sdk/bin/gcloud /usr/bin/gcloud
	dosym ${D}/usr/share/google-cloud-sdk/bin/gsutil /usr/bin/gsutil
	dosym ${D}/usr/share/google-cloud-sdk/bin/bq /usr/bin/bq

	# Install bash completion
	newbashcomp ${D}/usr/share/google-cloud-sdk/completion.bash.inc gcloud
	bashcomp_alias gcloud gsutil bq
}
