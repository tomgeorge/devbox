ifeq ($(ITERM_PROFILE),Default)
	DOCKER_GID := $(shell stat -f %g /var/run/docker.sock)
else
	DOCKER_GID := $(shell stat -c %g /var/run/docker.sock)
endif

WHOAMI := $(shell whoami)

build:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) --build-arg GPG_KEY=tgeorge.gpg -t devbox .

build_no_cache:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) --build-arg GPG_KEY=tgeorge.gpg --no-cache -t devbox .

build_base:
	docker build --build-arg DOCKER_GID=$(DOCKER_GID) -t devbox-base .

tag: 
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

dev_ssh_git:
	docker run --volumes-from ssh-keys --volumes-from git-repos -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:latest
	
dev_local:
	docker run  -v $(HOME)/.aws:/home/dev/.aws  --volumes-from ssh-keys -v $(HOME)/git/Devops:/home/dev/git/Devops -v $(HOME)/git/mob-playbooks:/home/dev/git/mob-playbooks -v /var/run/docker.sock:/var/run/docker.sock --net host -it tomgeorge/devbox:latest

dev_kube_do:
	docker run  -v $(HOME)/.aws:/home/dev/.aws  --volumes-from ssh-keys -v $(HOME)/git/kubernetes-digitalocean-terraform:/home/dev/git/kubernetes-digitalocean-terraform -v $(HOME)/git/kubernetes-manifests:/home/dev/kubernetes-manifests -v /var/run/docker.sock:/var/run/docker.sock --net host -it tomgeorge/devbox:latest
