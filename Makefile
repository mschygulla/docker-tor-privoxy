REPO = docker.io
NS = mschygulla
NAME = tor-privoxy
VERSION ?= latest
SHELL := /bin/bash

.PHONY: build push clean ubuntu test

default: build

build:
	docker build -t $(NAME):$(VERSION) .

ubuntu:
	docker build -t $(NAME):$(VERSION) -f ubuntu/Dockerfile .

test:
	docker run --rm $(NAME):$(VERSION) /usr/bin/tor --version
	docker run --rm $(NAME):$(VERSION) /usr/sbin/privoxy --version

push:
	docker tag $(NAME):$(VERSION) $(REPO)/$(NS)/$(NAME):$(VERSION)
	docker push $(REPO)/$(NS)/$(NAME):$(VERSION)

clean:
	-docker rmi $(REPO)/$(NS)/$(NAME):$(VERSION)
	-docker rmi $(NAME):$(VERSION)
