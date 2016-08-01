.PHONY: all build release

IMAGE=dddpaul/postgres
VERSION=$(shell cat VERSION)

all: build

build:
	@docker build -t ${IMAGE} .

debug:
	@docker run -i -t --entrypoint=sh ${IMAGE}

run:
	@docker run -i -P ${IMAGE}

release: build
	@docker build --tag=${IMAGE}:$(shell cat VERSION) .

deploy: release
	@docker push ${IMAGE}
	@docker push ${IMAGE}:$(shell cat VERSION)
