download https://github.com/protocolbuffers/protobuf/releases/download/v${protobuf}/protobuf-cpp-${protobuf}.tar.gz

cd ..

./configure \
    --prefix="${TOOLCHAIN}" \
    --disable-shared

patch -Np1 -i /src/protoc/musl-fix.patch

make -j $(nproc)
make install
