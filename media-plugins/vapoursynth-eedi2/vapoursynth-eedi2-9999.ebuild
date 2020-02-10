# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson

DESCRIPTION="EEDI2 is an vertical resizer intended for edge-directed interpolation for deinterlacing"
HOMEPAGE="https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI2"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/HomeOfVapourSynthEvolution/${PN}.git"
	KEYWORDS=""
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/HomeOfVapourSynthEvolution/${PN}/archive/r${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND+="
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}
"

DOCS=( "README.md" )


src_configure() {
	local emesonargs=(
		--libdir="/usr/$(get_libdir)/vapoursynth/"
	)
	meson_src_configure
}
