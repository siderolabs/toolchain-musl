download https://www.cpan.org/src/5.0/perl-${perl}.tar.xz

curl -L https://github.com/arsv/perl-cross/releases/download/${perlcross}/perl-cross-${perlcross}.tar.gz | tar --strip-components=1 -zx -C ../

cd ../

# ./configure \
#     --target=${TARGET} \
#     --prefix=${TOOLCHAIN}
./configure \
    --prefix=${TOOLCHAIN}
make -j $(nproc)
cp -v perl cpan/podlators/scripts/pod2man ${TOOLCHAIN}/bin
mkdir -pv ${TOOLCHAIN}/lib/perl5/${perl}
cp -Rv lib/* ${TOOLCHAIN}/lib/perl5/${perl}