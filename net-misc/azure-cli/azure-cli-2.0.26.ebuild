# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Command-Line Tools"
HOMEPAGE="https://pypi.python.org/pypi/azure-cli"
SRC_URI="mirror://pypi/a/azure-cli/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
SLOT="0"

IUSE="+acr +acs +advisor +appservice +backup +batch +batchai +billing +cdn \
	+cloud +cognitiveservices +consumption +container +cosmosdb +dla +dls \
	+eventgrid extension feedback +iot +keyvault +lab \
	+monitor +network +rdbms +redis +reservations +resource +role +sf \
	+sql +storage +vm"

RDEPEND="vm? ( dev-python/azure-cli-vm[${PYTHON_USEDEP}] )
	sql? ( dev-python/azure-cli-sql[${PYTHON_USEDEP}] )
	storage? ( dev-python/azure-cli-storage[${PYTHON_USEDEP}] )
	sf? ( dev-python/azure-cli-servicefabric[${PYTHON_USEDEP}] )
	role? ( dev-python/azure-cli-role[${PYTHON_USEDEP}] )
	resource? ( dev-python/azure-cli-resource[${PYTHON_USEDEP}] )
	reservations? ( dev-python/azure-cli-reservations[${PYTHON_USEDEP}] )
	redis? ( dev-python/azure-cli-redis[${PYTHON_USEDEP}] )
	rdbms? ( dev-python/azure-cli-rdbms[${PYTHON_USEDEP}] )
	dev-python/azure-cli-profile[${PYTHON_USEDEP}]
	dev-python/azure-cli-nspkg[${PYTHON_USEDEP}]
	network? ( dev-python/azure-cli-network[${PYTHON_USEDEP}] )
	monitor? ( dev-python/azure-cli-monitor[${PYTHON_USEDEP}] )
	lab? ( dev-python/azure-cli-lab[${PYTHON_USEDEP}] )
	keyvault? ( dev-python/azure-cli-keyvault[${PYTHON_USEDEP}] )
	dev-python/azure-cli-interactive[${PYTHON_USEDEP}]
	dev-python/azure-cli-find[${PYTHON_USEDEP}]
	iot? ( dev-python/azure-cli-iot[${PYTHON_USEDEP}] )
	feedback? ( dev-python/azure-cli-feedback[${PYTHON_USEDEP}] )
	extension? ( dev-python/azure-cli-extension[${PYTHON_USEDEP}] )
	eventgrid? ( dev-python/azure-cli-eventgrid[${PYTHON_USEDEP}] )
	dls? ( dev-python/azure-cli-dls[${PYTHON_USEDEP}] )
	dla? ( dev-python/azure-cli-dla[${PYTHON_USEDEP}] )
	cosmosdb? ( dev-python/azure-cli-cosmosdb[${PYTHON_USEDEP}] )
	dev-python/azure-cli-core[${PYTHON_USEDEP}]
	container? ( dev-python/azure-cli-container[${PYTHON_USEDEP}] )
	consumption? ( dev-python/azure-cli-consumption[${PYTHON_USEDEP}] )
	dev-python/azure-cli-configure[${PYTHON_USEDEP}]
	cognitiveservices? ( dev-python/azure-cli-cognitiveservices[${PYTHON_USEDEP}] )
	cloud? ( dev-python/azure-cli-cloud[${PYTHON_USEDEP}] )
	cdn? ( dev-python/azure-cli-cdn[${PYTHON_USEDEP}] )
	billing? ( dev-python/azure-cli-billing[${PYTHON_USEDEP}] )
	batchai? ( dev-python/azure-cli-batchai[${PYTHON_USEDEP}] )
	batch? ( dev-python/azure-cli-batch[${PYTHON_USEDEP}] )
	backup? ( dev-python/azure-cli-backup[${PYTHON_USEDEP}] )
	appservice? ( dev-python/azure-cli-appservice[${PYTHON_USEDEP}] )
	advisor? ( dev-python/azure-cli-advisor[${PYTHON_USEDEP}] )
	acs? ( dev-python/azure-cli-acs[${PYTHON_USEDEP}] )
	acr? ( dev-python/azure-cli-acr[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	distutils-r1_src_prepare
	rm az.bat || die
	sed -i -e '/az.bat/ d' setup.py || die
}

python_install() {
	distutils-r1_python_install

	python_export PYTHON_SITEDIR

	# The proper __init__.py is provided by dev-python/azure-cli-nspkg
	rm "${D%/}${PYTHON_SITEDIR}/azure/cli/__init__.py" || die
}
