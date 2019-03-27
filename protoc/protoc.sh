download https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-cpp-3.6.1.tar.gz

cd ..

./configure \
    --prefix="${TOOLCHAIN}" \
    --disable-shared

patch -Np1 -i /src/protoc/musl-fix.patch

make
make install
