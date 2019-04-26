TAG := $(shell gitmeta image tag)

COMMON_ARGS = --progress=plain
COMMON_ARGS += --frontend=dockerfile.v0
COMMON_ARGS += --local context=.
COMMON_ARGS += --local dockerfile=.
COMMON_ARGS += --opt build-arg:TOOLCHAIN_IMAGE=$(TOOLCHAIN_IMAGE)

BUILDKIT_HOST ?= tcp://0.0.0.0:1234

all: toolchain

.PHONY: core
core:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)

.PHONY: base
base:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)

.PHONY: extras
extras:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)

.PHONY: golang
golang:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)

.PHONY: protoc
protoc:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)

.PHONY: images
images:
	@source ./versions.sh && ./rootfs/base/kubernetes-images.sh

.PHONY: toolchain
toolchain:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)
	@docker load < $@.tar

.PHONY: common-base
common-base:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)
	@docker load < $@.tar

.PHONY: rootfs-base
rootfs-base:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)
	@docker load < $@.tar

.PHONY: initramfs-base
initramfs-base:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--output type=docker,dest=$@.tar,name=docker.io/autonomy/$@:$(TAG) \
		--opt target=$@ \
		$(COMMON_ARGS)
	@docker load < $@.tar

.PHONY: login
login:
	@docker login --username "$(DOCKER_USERNAME)" --password "$(DOCKER_PASSWORD)"

.PHONY: push
push:
	@docker tag autonomy/toolchain:$(TAG) autonomy/toolchain:latest
	@docker push autonomy/toolchain:$(TAG)
	@docker push autonomy/toolchain:latest
	@docker tag autonomy/rootfs-base:$(TAG) autonomy/rootfs-base:latest
	@docker push autonomy/rootfs-base:$(TAG)
	@docker push autonomy/rootfs-base:latest
	@docker tag autonomy/initramfs-base:$(TAG) autonomy/initramfs-base:latest
	@docker push autonomy/initramfs-base:$(TAG)
	@docker push autonomy/initramfs-base:latest
