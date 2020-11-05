BIN = alertmanager2es
NAME = registry.cn-hangzhou.aliyuncs.com/feifeigood/alertmanager2es
VERSION = $(shell git describe --tags --always --dirty=-dev)

.PHONY: build test shell push

build: test
	go build -ldflags "-X main.revision=$(shell git describe --tags --always --dirty=-dev)"

build-linux:
	env GOOS=linux GOARCH=amd64 go build -o $(BIN)_linux_amd64 -ldflags "-X main.revision=$(shell git describe --tags --always --dirty=-dev)"

test:
	go test $(go list ./... | grep -v /vendor/)

container:
	docker build -t $(NAME):$(VERSION) .

tag-latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

push: container tag-latest
	docker push $(NAME):$(VERSION); docker push $(NAME):latest