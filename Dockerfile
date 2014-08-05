FROM mikespokefire/drone-base


RUN apt-get update
RUN apt-get install -y docker.io
RUN ln -sf /usr/bin/docker.io /usr/local/bin/docker
RUN sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
ENV RBENV_ROOT /root/.rbenv

RUN rbenv install 2.1.2
RUN echo "install: --no-document \n update: --no-document" >> /root/.gemrc
RUN rbenv global 2.1.2 && /root/.rbenv/shims/gem install bundler && rbenv rehash
