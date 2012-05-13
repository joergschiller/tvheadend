CHANGELOG=debian/changelog
NOW=`date -R`
VER=`git describe | sed "s/\([0-9]*\)\.\([0-9]*\)-\([0-9]*\)-.*/\1.\2.\3/"`
echo >${CHANGELOG} "tvheadend (${VER}) unstable; urgency=low"
echo >>${CHANGELOG}
echo >>${CHANGELOG} "  * The full changelog can be found at "
echo >>${CHANGELOG} "    http://www.lonelycoder.com/tvheadend/download"
echo >>${CHANGELOG}
echo >>${CHANGELOG} " -- Andreas Öman <andreas@lonelycoder.com>  ${NOW}"
cat ${CHANGELOG}
export JOBSARGS
export JARGS

dpkg-buildpackage -S -sa -rfakeroot || true
pbuilder-precise update
pbuilder-precise build ../tvheadend_${VER}.dsc

rm -f ${CHANGELOG}
dh_clean
