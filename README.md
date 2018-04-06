[![Build Status](https://travis-ci.org/tomgeorge/devbox.svg?branch=master)](https://travis-ci.org/tomgeorge/devbox)

Vagrant configuration and a Dockerfile that acts similarly. Mostly focusing on the docker image now and provisioning a fresh instance to run the image.

### Provisioning a droplet on DigitalOcean

First scp your ssh keys into the droplet

Then run `sh/provision_droplet.sh`.  This makes a user called `dev` with password `dev`, and gives it the ssh keys to authenticate with github.

Running `build.sh` builds the docker image.

`make dev` runs the image and grabs voulmes from a gopath and ssh_keys image (to be automated)
