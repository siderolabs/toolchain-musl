download https://mirrors.edge.kernel.org/pub/software/scm/git/git-${git}.tar.xz

# This is a dirty hack to get around th fact that gettext binaries don't seem
# to be aware of /toolchain/lib in its' library search path.
cp ${TOOLCHAIN}/lib/libgomp* /lib

cd ..
make configure
./configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
make install
