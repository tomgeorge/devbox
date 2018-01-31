build:
	docker build -t devbox .

tag: build
	docker tag devbox tomgeorge/devbox:master

push: tag
	docker push tomgeorge/devbox:master

tmux:
	docker run -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:master tmux -2
