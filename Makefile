TAG := $(shell gitmeta image tag)

COMMON_ARGS = --progress=plain
COMMON_ARGS += --frontend=dockerfile.v0
COMMON_ARGS += --local context=.
COMMON_ARGS += --local dockerfile=.
COMMON_ARGS += --frontend-opt build-arg:TOOLCHAIN_IMAGE=$(TOOLCHAIN_IMAGE)

all: toolchain

.PHONY: core
core:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
		$(COMMON_ARGS)

.PHONY: base
base:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
		$(COMMON_ARGS)

.PHONY: extras
extras:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
		$(COMMON_ARGS)

.PHONY: golang
golang:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
		$(COMMON_ARGS)

.PHONY: protoc
protoc:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
		$(COMMON_ARGS)

.PHONY: toolchain
toolchain:
	@buildctl --addr $(BUILDKIT_HOST) \
		build \
		--exporter=docker \
		--exporter-opt output=$@.tar \
		--exporter-opt name=docker.io/autonomy/$@:$(TAG) \
		--frontend-opt target=$@ \
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
