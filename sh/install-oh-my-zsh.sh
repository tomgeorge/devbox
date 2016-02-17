#!/usr/bin/env bash
git clone https://github.com/tomgeorge/oh-my-zsh.git /home/vagrant/.oh-my-zsh || true
chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh
chsh -s /bin/zsh vagrant
