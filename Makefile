build:
	docker build -t devbox .

tag: build
	docker tag devbox tomgeorge/devbox:master

login:
	docker login 

push: tag login
	docker push tomgeorge/devbox:master

tmux: tag
	docker run --volumes-from ssh-keys -v /var/run/docker.sock:/var/run/docker.sock -it tomgeorge/devbox:master tmux -2
