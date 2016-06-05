# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_{4,5} )
AUTOTOOLS_AUTORECONF=1

inherit autotools-utils multilib python

DESCRIPTION="MVTools is a set of filters for motion estimation and compensation"
HOMEPAGE="https://github.com/IFeelBloated/vapoursynth-mvtools"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/IFeelBloated/${PN}.git"
	KEYWORDS=""
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/IFeelBloated/${PN}/archive/r${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND+="
	media-libs/vapoursynth
	sci-libs/fftw:3.0
"
DEPEND="${RDEPEND}
"

DOCS=( README.md )

src_configure() {
	autotools-utils_src_configure --libdir="/usr/$(get_libdir)/vapoursynth/"
}

src_install() {
	autotools-utils_src_install 
	insinto "$(python_get_sitedir)"
	doins src/mvmulti.py
}
