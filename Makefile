IMAGE_NAME := "win7/jupyterlab"
TAG        := "v1.1.1"

.PHONY: all
all: build-image

.PHONY: build-image
build-image:
	@echo ">> build mysql image"
	@docker build -t ${IMAGE_NAME}:${TAG} -f Dockerfile .

.PHONY: push
push:
	@echo ">> push image to hub"
	@docker push ${IMAGE_NAME}:${TAG}

