ifeq ($(DOCKER_GID),)
	DOCKER_GID := $(shell stat -c %g /var/run/docker.sock)
endif

build_base:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) -t devbox-base .
build:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) -t devbox .

tag: build
	docker tag devbox tomgeorge/devbox:latest

login:
	docker login 

push: tag login
	docker push tomgeorge/devbox:latest

tmux: tag
	docker run --volumes-from ssh-keys -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:latest tmux -2u

dev:
	docker run --volumes-from ssh-keys --volumes-from gopath --volumes-from minikube --volumes-from kubeconfig --volumes-from git_vol -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:latest

dev_ssh:
	docker run --volumes-from ssh-keys -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:latest
	
