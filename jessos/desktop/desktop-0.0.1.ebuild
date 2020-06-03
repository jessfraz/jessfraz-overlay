# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="JessOS desktop (meta package)"
HOMEPAGE="http://jess.dev"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-crypt/pinentry[static(+)]
	app-pda/libimobiledevice
	jessos/base
	jessos/dev
	media-gfx/feh
	media-gfx/scrot
	media-libs/mesa
	media-sound/pulseaudio[alsa(+),alsa-plugin(+),bluetooth(+),dbus(+)]
	media-sound/pulsemixer
	net-wireless/iwd[client(+),monitor(+)]
	sys-apps/light
	sys-apps/usbutils
	www-client/google-chrome
	x11-base/xorg-drivers
	x11-base/xorg-server
	x11-drivers/xf86-video-intel
	x11-misc/i3lock
	x11-misc/i3status
	x11-misc/rofi
	x11-misc/xclip
	x11-terms/rxvt-unicode[256-color(+),blinking(+),fading-colors(+),font-styles(+),gdk-pixbuf(+),iso14755(+),mousewheel(+),unicode3(+),xft(+)]
	x11-wm/i3
"
