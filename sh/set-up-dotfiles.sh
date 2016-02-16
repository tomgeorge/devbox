#!/usr/bin/env bash
git clone https://github.com/tomgeorge/dotfiles /home/vagrant/dotfiles || true
chown -R vagrant:vagrant /home/vagrant/dotfiles
bash /home/vagrant/dotfiles/links-vagrant.sh
