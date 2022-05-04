#!/bin/bash
#
# Setup nvim config on Ubuntu system

set -e

if [ -f "${CACHE_DIR}/.vim" ]; then
    echo "Git has been configured successfully."
    exit 0
fi

echo "Setup vim ..."
# Install neovim
sudo apt-get install -y neovim
sudo apt-get install -y python3-neovim
sudo apt-get install -y npm
sudo npm install -g neovim
vim_path=${which vim}
sudo rm -f ${vim_path}
sudo ln -s $(which nvim) ${vim_path}

# Fzf Dependencies
sudo apt-get install -y fzf bat silversearcher-ag ripgrep perl

# Coc dependencies
sudo npm install -g yarn
pip install -U jedi-language-server

touch ${CACHE_DIR}/.vim
echo "Setup nvim done."
