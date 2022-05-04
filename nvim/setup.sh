#!/bin/bash
#
# Setup nvim config on Ubuntu system

if [ -f "${CACHE_DIR}/.vim" ]; then
    echo "Git has been configured successfully."
    exit 0
fi

echo "Setup vim ..."
# Install neovim
wget -O /tmp/nvim.deb https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
sudo apt install /tmp/nvim.deb
sudo apt-get install -y python3-neovim
sudo apt-get install -y npm
sudo npm install -g neovim
vim_path=$(which vim)
sudo rm -f ${vim_path}
sudo ln -s $(which nvim) ${vim_path}
mkdir -p ${HOME}/.config/nvim

# Fzf Dependencies
sudo apt-get install -y fzf bat silversearcher-ag ripgrep perl

# Coc dependencies
sudo npm install -g yarn bash-language-server
pip install -U jedi-language-server neovim pynvim

touch ${CACHE_DIR}/.vim
echo "Setup nvim done."
