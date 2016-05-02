.PHONY: all build release

all: build

build:
	@docker build -t dddpaul/postgres .

debug:
	@docker run -i -t --entrypoint=sh dddpaul/postgres

run:
	@docker run -i -P dddpaul/postgres

release: build
	@docker build --tag=dddpaul/postgres:$(shell cat VERSION) .
