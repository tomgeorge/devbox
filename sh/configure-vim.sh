#!/usr/bin/env bash
git clone https://github.com/tomgeorge/vimfiles /home/vagrant/.vim || true
vi +PluginInstall +qall
chown -R vagrant:vagrant /home/vagrant/.vim
