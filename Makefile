# Makefile to help with nmtan/varnish
#

DOCKER_BIN := docker
IMAGE_NAME := nmtan/varnish

# List of available version of varnish on alpine
# Fornow this is the only available version
ALPINE_VARNISH_VERSIONS := \
	4.1.9-r0

# Build target to build all version we want
build: ${ALPINE_VARNISH_VERSIONS}_build

$(ALPINE_VARNISH_VERSIONS)_build:
	$(eval VER := $(shell echo $@ | sed -e 's/_build$\//'))
	@echo Building ${IMAGE_NAME}:${VER}
	${DOCKER_BIN} build --build-arg VARNISH_VERSION=${VER} -t ${IMAGE_NAME}:${VER} .

# Build target to push all version we want
push: build ${ALPINE_VARNISH_VERSIONS}_push
	${DOCKER_BIN} push ${IMAGE_NAME}

$(ALPINE_VARNISH_VERSIONS)_push:
	$(eval VER := $(shell echo $@ | sed -e 's/_push$\//'))
	@echo Pushing ${IMAGE_NAME}:${VER}
	${DOCKER_BIN} push ${IMAGE_NAME}:${VER}
