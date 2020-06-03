# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./scripts/shellcheck.sh

DOCKER_IMAGE:=r.j3ss.co/distro

.PHONY: build
build: ## Builds the docker image.
	@DOCKER_CONTENT_TRUST=0 docker build --rm --force-rm \
		-t $(DOCKER_IMAGE) .

.PHONY: shell
shell: build ## Pop into a shell.
	@DOCKER_CONTENT_TRUST=0 docker run --rm -i $(DOCKER_FLAGS) \
		-v $(CURDIR):/var/db/repos/jessfraz \
		$(DOCKER_IMAGE) \
		bash

.PHONY: test
test: build ## Run tests on the overlay.
	@DOCKER_CONTENT_TRUST=0 docker run --rm -i $(DOCKER_FLAGS) \
		-v $(CURDIR):/var/db/repos/jessfraz \
		$(DOCKER_IMAGE) \
		repoman -dx full

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
