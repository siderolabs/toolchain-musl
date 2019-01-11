download https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.20.1.tar.xz

cd ..
make configure
./configure \
    --prefix=${TOOLCHAIN}
make
make install
