FROM mikespokefire/drone-base


RUN apt-get update
RUN apt-get install -y docker.io
RUN ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

WORKDIR /home/ubuntu
USER ubuntu

RUN export PATH=/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:$PATH               && \
    cd ~/.rbenv/plugins/ruby-build                                                    && \
    git pull                                                                          && \
    export RBENV_VERSION=2.1.1                                                        && \
    CC=gcc rbenv install 2.1.1                                                        && \
    rbenv rehash                                                                      && \
    rbenv global 2.1.1                                                                && \
    rbenv rehash                                                                      && \
    gem install bundler                                                               && \
    rbenv rehash

ADD rbenv.sh /etc/drone.d/
