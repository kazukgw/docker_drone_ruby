FROM bradrydzewski/base

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
