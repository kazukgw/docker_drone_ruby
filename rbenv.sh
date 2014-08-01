# add rbenv to path
export PATH="/home/ubuntu/.rbenv/bin:/home/ubuntu/.rbenv/shims:$PATH"
rbenv rehash

# set default env vars
export RBENV_VERSION=2.1.1
export RAILS_ENV=${RAILS_ENV:-test}

