#!/bin/bash
#
# Setup all config on Ubuntu system.
# TODO add other system.

set -e

# Use the cache file to record whether the configuration is successful.
export CACHE_DIR="/home/${USER}/.cache/is_config"

if [ "${1}" == "resetup" ]; then
    echo "Resetup config."
    rm -rf ${CACHE_DIR}
fi
mkdir -p ${CACHE_DIR}

# Git setup
./git/setup.sh

# Zsh(oh-my-zsh) setup
./zsh/setup.sh

# Python setup
./python/setup.sh

# Golang setup
#./golang/setup.sh

# VIM setup
./vim/setup.sh

# Tmux setup
./tmux/setup.sh
