ifeq ($(DOCKER_GID),)
	DOCKER_GID := $(shell stat -c %g /var/run/docker.sock)
endif

build:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) -t devbox .

tag: build
	docker tag devbox tomgeorge/devbox:master

login:
	docker login 

push: tag login
	docker push tomgeorge/devbox:master

tmux: tag
	docker run --volumes-from ssh-keys -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:master tmux -2

dev:
	docker run --volumes-from ssh-keys --volumes-from gopath --volumes-from minikube --volumes-from kubeconfig --volumes-from git_vol -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:master
