# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=2

DESCRIPTION="JessOS base (meta package)"
HOMEPAGE="http://jess.dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
	bash-completion
	minimal
	seccomp
	static
	static-libs
	systemd
	-selinux
"

################################################################################
#
# READ THIS BEFORE ADDING PACKAGES TO THIS EBUILD!
#
################################################################################
#
# Every jessos dependency (along with its dependencies) is included in the
# release image -- more packages contribute to longer build times, a larger
# image, slower and bigger auto-updates, increased security risks, etc. Consider
# the following before adding a new package:
#
# 1. Does the package really need to be part of the release image?
#
# Some packages can be included only in the developer or test images, i.e., the
# chromeos-dev or chromeos-test ebuilds. If the package will eventually be used
# in the release but it's still under development, consider adding it to
# chromeos-dev initially until it's ready for production.
#
# 2. Why is the package a direct dependency of the chromeos ebuild?
#
# It makes sense for some packages to be included as a direct dependency of the
# chromeos ebuild but for most it doesn't. The package should be added as a
# direct dependency of the ebuilds for all packages that actually use it -- in
# time, this ensures correct builds and allows easier cleanup of obsolete
# packages. For example, if a utility will be invoked by the session manager,
# its package should be added as a dependency in the chromeos-login ebuild. Or
# if the package adds a daemon that will be started through an upstart job, it
# should be added as a dependency in the chromeos-init ebuild. If the package
# really needs to be a direct dependency of the chromeos ebuild, consider adding
# a comment why the package is needed and how it's used.
#
# 3. Are all default package features and dependent packages needed?
#
# The release image should include only packages and features that are needed in
# the production system. Often packages pull in features and additional packages
# that are never used. Review these and consider pruning them (e.g., through USE
# flags).
#
# 4. What is the impact on the image size?
#
# Before adding a package, evaluate the impact on the image size. If the package
# and its dependencies increase the image size significantly, consider
# alternative packages or approaches.
#
# 5. Is the package needed on all targets?
#
# If the package is needed only on some target boards, consider making it
# conditional through USE flags in the board overlays.
#
################################################################################

RDEPEND="
	app-admin/sudo
	app-arch/gzip
	app-arch/tar
	app-arch/unzip
	app-arch/xz-utils
	app-arch/zip
	app-crypt/gnupg
	app-crypt/pinentry
	app-editors/vim
	app-misc/ca-certificates
	app-misc/jq
	app-pda/libimobiledevice
	app-shells/bash
	app-shells/bash-completion
	app-text/tree
	dev-util/indent
	dev-util/strace
	dev-vcs/git
	net-dns/bind-tools
	net-firewall/ebtables
	net-firewall/ipset
	net-firewall/iptables
	net-firewall/nftables
	net-misc/bridge-utils
	net-misc/curl
	net-misc/dhcpcd
	net-misc/iputils
	net-misc/ntp
	net-misc/openssh
	net-misc/rsync
	net-misc/socat
	net-misc/wget
	net-misc/whois
	net-wireless/iwd
	sys-apps/apparmor
	sys-apps/apparmor-utils
	sys-apps/coreutils
	sys-apps/dbus
	sys-apps/diffutils
	sys-apps/ethtool
	sys-apps/file
	sys-apps/findutils
	sys-apps/fwupd[thunderbolt,dell]
	sys-apps/gawk
	sys-apps/grep
	sys-apps/iproute2
	sys-apps/kexec-tools
	sys-apps/less
	sys-apps/lshw
	sys-apps/net-tools
	sys-apps/nvme-cli
	sys-apps/pciutils
	sys-apps/rng-tools
	sys-apps/sed
	sys-apps/shadow
	sys-apps/systemd[resolvconf,apparmor]
	sys-apps/the_silver_searcher
	sys-apps/usbutils
	sys-apps/util-linux
	sys-apps/which
	sys-block/open-iscsi
	sys-devel/gcc
	sys-devel/make
	sys-fs/btrfs-progs
	sys-fs/dosfstools
	sys-fs/e2fsprogs
	sys-fs/lvm2
	sys-fs/mdadm
	sys-fs/multipath-tools
	sys-fs/quota
	sys-fs/xfsprogs
	sys-libs/glibc
	sys-libs/timezone-data
	sys-process/lsof
	sys-process/procps
	sys-process/psmisc
"
