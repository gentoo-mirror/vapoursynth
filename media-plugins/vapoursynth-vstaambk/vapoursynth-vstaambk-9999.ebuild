# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit python-single-r1 git-r3

DESCRIPTION="A ported AA-script from Avisynth"
HOMEPAGE="https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk.git"
	KEYWORDS=""
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/HomeOfVapourSynthEvolution/vsTAAmbk/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi


LICENSE=""
SLOT="0"
IUSE="opencl"

RDEPEND+="
	media-libs/vapoursynth[${PYTHON_SINGLE_USEDEP},vapoursynth_plugins_removegrain,vapoursynth_plugins_miscfilters]
	media-plugins/vapoursynth-awarpsharp2
	media-plugins/vapoursynth-eedi2
	media-plugins/vapoursynth-fmtconv
	media-plugins/vapoursynth-havsfunc
	media-plugins/vapoursynth-mvsfunc
	media-plugins/vapoursynth-mvtools
	media-plugins/vapoursynth-nnedi3
	media-plugins/vapoursynth-sangnom
	media-plugins/vapoursynth-znedi3
	opencl? (
		media-plugins/vapoursynth-eedi3[opencl]
		media-plugins/vapoursynth-nnedi3cl
		media-plugins/vapoursynth-tcanny[opencl]
		)
	!opencl? (
		media-plugins/vapoursynth-eedi3
		media-plugins/vapoursynth-tcanny
		)
"
DEPEND="${RDEPEND}"

DOCS=( "README.md" "doc/Documentation_EN.html" )

src_install(){
	python_domodule vsTAAmbk.py
}
