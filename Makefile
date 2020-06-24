COMMIT=$(shell git rev-parse HEAD)
BRANCH_NAME=$(shell git rev-parse --abbrev-ref HEAD)

.PHONY: DEFAULT_GOAL
DEFAULT_GOAL: help

help:
	@echo  "build:              Build the images "
	@echo  "shell:                 Run the containers"

build:
	@echo "Build container at branch: ${BRANCH_NAME} commit: ${COMMIT}"
	docker build -t krol/node-hello:$(BRANCH_NAME)  .

run:
	docker run --rm -it -p 8080:8080 krol/node-hello:$(BRANCH_NAME) 
