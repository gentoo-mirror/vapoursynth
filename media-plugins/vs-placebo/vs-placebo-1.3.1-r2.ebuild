# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson git-r3

DESCRIPTION="libplacebo-based debanding, scaling and color mapping plugin for VapourSynth"
HOMEPAGE="https://github.com/Lypheo/vs-placebo"

EGIT_REPO_URI="https://github.com/Lypheo/vs-placebo.git"
EGIT_COMMIT="a8be1640483dad34e2872834aa99e71dea5882e0"
KEYWORDS="~amd64 ~x86"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="lto"

RDEPEND+="
	>=media-libs/libplacebo-2.72.0
	media-libs/vapoursynth
"
DEPEND="${RDEPEND}"

DOCS=( "README.md" )


src_configure() {
	local emesonargs=(
		-Db_lto=$(usex lto true false)
	)
	meson_src_configure
}
