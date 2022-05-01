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
vim_path=${which vim}
sudo rm -f ${vim_path}
sudo ln -s $(which nvim) ${vim_path}

touch ${CACHE_DIR}/.vim
echo "Setup nvim done."