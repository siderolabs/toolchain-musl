download https://sourceforge.net/projects/tcl/files/Tcl/${tcl}/tcl-core${tcl}-src.tar.gz

../unix/configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
case "${tcl}" in
8.6.8)
chmod -v u+w ${TOOLCHAIN}/lib/libtcl8.6.so
esac
make install-private-headers
ln -sv tclsh8.6 ${TOOLCHAIN}/bin/tclsh
