#!/usr/bin/env bash
git clone https://github.com/tomgeorge/dotfiles /home/vagrant/dotfiles || cd /home/vagrant/dotfiles && git pull origin master
chown -R vagrant:vagrant /home/vagrant/dotfiles
bash /home/vagrant/dotfiles/links-vagrant.sh
