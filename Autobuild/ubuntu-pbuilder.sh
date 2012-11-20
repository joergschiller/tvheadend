CHANGELOG=debian/changelog
NOW=`date -R`
VER=`git describe | sed "s/v\?\([0-9]*\)\.\([0-9]*\)-\([0-9]*\)-.*/\1.\2.\3/"`
echo >${CHANGELOG} "tvheadend (${VER}) unstable; urgency=low"
echo >>${CHANGELOG}
echo >>${CHANGELOG} "  * The full changelog can be found at"
echo >>${CHANGELOG} "    https://github.com/tvheadend/tvheadend/commits/master"
echo >>${CHANGELOG}
echo >>${CHANGELOG} " -- Tvheadend <dummy@dummy.org>  ${NOW}"
cat ${CHANGELOG}
export JOBSARGS
export JARGS

dpkg-buildpackage -S -sa -rfakeroot || true
${PBUILDER} update
${PBUILDER} build ../tvheadend_${VER}.dsc

dh_clean
