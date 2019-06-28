CONTAINERS := $(patsubst %/,%, $(dir $(wildcard */Dockerfile)))

.PHONY: all docker_build dockerfile_% pull_base

all: docker_build

pull_base:
	@docker pull archlinux/base

dockerfile_%:
	@echo "Building c/$*"
	@cd $* ; docker build -t c/$* .
	@echo "Done building c/$*"

docker_build: $(addprefix dockerfile_,$(CONTAINERS))
