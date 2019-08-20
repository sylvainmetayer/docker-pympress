.DEFAULT_GOAL := help

IMAGE_NAME=sylvainmetayer/pympress

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the docker image
	docker build -t $(IMAGE_NAME) .

tag_latest: build ## Tag a new 'latest' version of an image
	docker tag $(IMAGE_NAME) $(IMAGE_NAME)

tag_version: build ## Tag a specific version of an image. Run with make version=1.0 tag_version
	docker tag $(IMAGE_NAME) $(IMAGE_NAME):$(version)
	docker login
	docker push sylvainmetayer/pympress:$(version)

push: tag_latest ## Push the latest image to the dockerhub
	docker login
	docker push sylvainmetayer/pympress
