SHA := $(shell gitmeta git sha)
TAG := $(shell gitmeta image tag)
BUILT := $(shell gitmeta built)

COMMON_ARGS := -f ./Dockerfile .

export DOCKER_BUILDKIT := 1

all: toolchain

enforce:
	@conform enforce

.PHONY: core
core:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

.PHONY: base
base:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

.PHONY: extras
extras:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

.PHONY: golang
golang:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

.PHONY: protoc
protoc:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

.PHONY: toolchain
toolchain:
	@docker build \
		-t autonomy/$@:$(SHA) \
		--target=$@ \
		-f ./Dockerfile .

deps:
	@GO111MODULES=on CGO_ENABLED=0 go get -u github.com/autonomy/gitmeta
	@GO111MODULES=on CGO_ENABLED=0 go get -u github.com/autonomy/conform
