FROM ubuntu
MAINTAINER Tom George

# ENV http_proxy http://10.0.2.2:3128
# ENV https_proxy https://10.0.2.2:3128

RUN apt-get update -y
RUN apt-get install -y vim \
	wget \
	curl \
	git  \
	zsh \
	dos2unix \
	tmux

RUN useradd dev
RUN mkdir /home/dev 
RUN mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV LD_LIBRARY_PATH /home/dev/lib


# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared/
RUN touch /var/shared/placeholder
RUN chown -R dev:dev /var/shared
VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev

ADD dotfiles/vimrc /home/dev/.vimrc
ADD dotfiles/zshrc /home/dev/.zshrc
ADD dotfiles/gitconfig /home/dev/.gitconfig
ADD dotfiles/tmux.conf /home/dev/.tmux.conf
ADD vim /home/dev/.vim

RUN ln -s /var/shared/.ssh
RUN git clone https://github.com/tomgeorge/oh-my-zsh.git /home/dev/.oh-my-zsh

RUN chown -R dev:dev /home/dev
USER dev
