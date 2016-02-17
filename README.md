Vagrant configuration and a Dockerfile that acts similarly.


```
docker run -it tomgeorge/devbox /usr/bin/env zsh
```

If you're behind a proxy, like when you're at work:

```
docker run --net host -it tomgeorge/devbox /usr/bin/env zsh
```
