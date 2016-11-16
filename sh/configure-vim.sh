#!/usr/bin/env bash
git clone https://github.com/tomgeorge/vimfiles /home/vagrant/.vim || cd /home/vagrant.vim && git pull origin master
# vi +PluginInstall +qall
chown -R vagrant:vagrant /home/vagrant/.vim
