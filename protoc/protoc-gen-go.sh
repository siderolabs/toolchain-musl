export GOPATH="${PWD}"

REPO_PATH=github.com/golang/protobuf

mkdir -p "src/${REPO_PATH}/build"
cd "src/${REPO_PATH}/build"

download https://github.com/golang/protobuf/archive/v${protobufGo}/golang-protobuf-${protobufGo}.tar.gz

cd ../protoc-gen-go
PATH="${TOOLCHAIN}/go/bin:${PATH}" GOBIN="${TOOLCHAIN}/bin" go install .
