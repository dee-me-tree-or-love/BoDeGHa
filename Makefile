LOCAL_DOCKER_TAG="bodegha-local:latest"
VOLUME_MAP?=./.data:/bodegha/.data


.PHONY: build-docker run-docker
build-docker: ./Dockerfile
	docker buildx build -t ${LOCAL_DOCKER_TAG} .
	@echo "✅ Docker image built with tag: ${LOCAL_DOCKER_TAG}"
	@echo "💡 Run the image with the following command:"
	@echo "\t$$ docker run --rm -it -v ${VOLUME_MAP} ${LOCAL_DOCKER_TAG} <your bodegha command here>"
