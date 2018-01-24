FROM ubuntu:14.04
MAINTAINER Tom George

# ENV http_proxy http://10.0.2.2:3128
# ENV https_proxy https://10.0.2.2:3128

# ADD 01proxy /etc/apt/apt.conf.d
RUN apt-get update && \
    apt-get install -y vim \
        software-properties-common \
        wget \
        curl \
        libcurl4-openssl-dev \
        zsh \
        dos2unix \
        tmux \
        build-essential \
        git \
        apt-file \
        python3-pip

RUN add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && \ 
    apt-get install -y neovim

ADD https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64 /usr/local/bin/gosu
RUN chmod 775 /usr/local/bin/gosu

RUN mkdir /home/dev 
RUN mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV LD_LIBRARY_PATH /home/dev/lib:$LD_LIBRARY_PATH


RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev
RUN mkdir -p /home/dev/.local/share/nvim/shada && \
        touch /home/dev/.local/share/nvim/shada/main.shada && \
        chmod -R 775 /home/dev/.local

RUN git clone https://github.com/tomgeorge/oh-my-zsh.git ~/.oh-my-zsh
RUN git clone https://github.com/tomgeorge/dotfiles
RUN git clone https://github.com/tomgeorge/vimfiles /home/dev/.vim

RUN cd dotfiles && ./links.sh

RUN pip3 install neovim

RUN nvim -E -s -c "source ~/.config/nvim/init.vim" -c PluginInstall -c qa -V || true
RUN nvim -E -s -c "source ~/.config/nvim/init.vim" -c UpdateRemotePlugins -c qa -V || true

RUN ln -s /var/shared/.ssh

ADD docker_entrypoint.sh /usr/local/bin
RUN chmod 775 /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["docker_entrypoint.sh"]
CMD ["/usr/bin/zsh"]
