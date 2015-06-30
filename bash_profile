export CLICOLOR=1

# I use the BACKGROUND environment variable
# in the ~/.vimrc file to select the right
# color scheme. Possible values are "light"
# and "dark"
# export BACKGROUND="light"
export BACKGROUND="dark"

if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
fi

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# SBT
#export SBT_OPTS="-XX:MaxPermSize=512m"

# GCC
export CC=gcc-4.9
export CXX=g++-4.9

export DYLD_LIBRARY_PATH="/Users/dario/local/lib/:$DYLD_LIBRARY_PATH"
# CUDA
#CUDA_VERSION=6.5
CUDA_VERSION=7.0
export PATH="/Developer/NVIDIA/CUDA-$CUDA_VERSION/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:/Developer/NVIDIA/CUDA-$CUDA_VERSION/lib:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-$CUDA_VERSION/lib:$LD_LIBRARY_PATH
# added by Anaconda 2.1.0 installer
export PATH="/Users/dario/anaconda/bin:$PATH"
export PYTHONPATH="/Users/dario/anaconda/lib/python2.7:/Users/dario/lib/python/"

# Postgres
export PGDATA="/usr/local/var/postgres"

# Theano
#export DYLD_FALLBACK_LIBRARY_PATH="/Users/dario/anaconda/lib:$DYLD_FALLBACK_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/Users/dario/anaconda/lib:$LD_LIBRARY_PATH"

# User bin folder
export PATH="/Users/dario/bin/:$PATH"

# Java
#export JAVA_HOME=$(/usr/libexec/java_home -v1.6)
export JAVA_HOME=$(/usr/libexec/java_home -v1.7)
#export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

# Kafka
export KAFKA_HOME="/usr/local/opt/kafka/"
alias start_kafka="kafka-server-start.sh $KAFKA_HOME/libexec/config/server.properties"

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/dario/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=/Users/dario/gopath

# Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Rust
export RUST_SRC_PATH='/Users/dario/opt/rust/src'

# Torch
DYLD_LIBRARY_PATH="/Users/dario/torch/install/lib:$DYLD_LIBRARY_PATH"
LD_LIBRARY_PATH="/Users/dario/torch/install/lib:$LD_LIBRARY_PATH"
PATH="/Users/dario/torch/install/bin:$PATH"

# Alias
alias java7="JAVA_HOME=$(/usr/libexec/java_home -v1.7)"
alias ll="ls -lh"
alias findd='find . -type d'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
