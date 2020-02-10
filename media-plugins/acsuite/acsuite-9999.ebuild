# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit python-single-r1

DESCRIPTION="Frame-based cutting/trimming/splicing of audio files from within VapourSynth"
HOMEPAGE="https://github.com/OrangeChannel/acsuite"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/OrangeChannel/acsuite.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/OrangeChannel/acsuite/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE=""
SLOT="0"
IUSE=""

RDEPEND+="
	media-libs/vapoursynth[${PYTHON_SINGLE_USEDEP}]
	media-video/mkvtoolnix
"
DEPEND="${RDEPEND}"

DOCS=( "README.md" )


src_install(){
	python_domodule acsuite.py
}
