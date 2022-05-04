#!/bin/bash
#
# Setup Python config on Ubuntu system

set -e

if [ -f "${CACHE_DIR}/.python" ]; then
    echo "Python has been configured successfully."
    exit 0
fi

echo "Setup Python ..."
# Install pyenv
if [ ! -d "/home/${USER}/.pyenv" ]; then
    echo "  Install pyenv and plugins."
    # https://github.com/pyenv/pyenv-installer
    curl https://pyenv.run | bash
fi
# Config pyenv for zsh
if [ -z "$(grep pyenv ~/.profile)" ]; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
    echo 'eval "$(pyenv init --path)"' >> ~/.zprofile
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
    echo 'eval "$(pyenv init --path)"' >> ~/.profile
fi
if [ -z "#(grep pyenv ~/.zshrc)" ]; then
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
fi

# Install Python build dependencies
sudo apt-get install -y -q make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install Python3.10
echo "  Install Python3.10.0"
~/.pyenv/bin/pyenv install -s 3.10.0
~/.pyenv/bin/pyenv global 3.10.0

# Install IPython
echo "  Install ipython"
pip install --upgrade pip
pip install ipython

touch ${CACHE_DIR}/.python
echo "Setup Python done."
