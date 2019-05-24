# build bootstrap Go 1.4 which doesn't depend on Go to build itself

mkdir -p go1.4-bootstrap/build
cd go1.4-bootstrap/build

if [[ ${ARCH} == "x86_64 " ]]; then
	download https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz
	cd ../src
	sh make.bash
	cd ..
	export GOROOT_BOOTSTRAP="$PWD"
	cd ..
else
	tar -xvf /go-linux-arm64-bootstrap.tbz --strip-components=1
	export GOROOT_BOOTSTRAP="$PWD"
fi


# build desired Go version using bootstrap Go 1.4

mkdir -p go/build
cd go/build

download https://dl.google.com/go/go${go}.src.tar.gz

cd ../src

export GOROOT_FINAL="$TOOLCHAIN/go"

sh make.bash

cd ..

# cleanup a bit
rm -rf pkg/obj
rm -rf pkg/bootstrap
rm -f pkg/tool/*/api
find src \( -type f -a -name "*_test.go" \) \
		-exec rm -rf \{\} \+
	find src \( -type d -a -name "testdata" \) \
		-exec rm -rf \{\} \+
	find src -type f -a \( -name "*.bash" -o -name "*.rc" -o -name "*.bat" \) \
		-exec rm -rf \{\} \+

mkdir -p "$GOROOT_FINAL"
mv * "$GOROOT_FINAL"

if [[ ${ARCH} == "x86_64 " ]]; then
	cd /tmp
	curl -LO https://dl.google.com/go/go${go}.src.tar.gz
	tar -xvf go1.12.5.src.tar.gz
	cd go/src
	mkdir -p /usr/bin && ln -s /toolchain/bin/env /usr/bin/env
	env GOOS=linux GOARCH=arm64 ./bootstrap.bash
	env GOOS=linux GOARCH=arm GOARM=7 ./bootstrap.bash
fi