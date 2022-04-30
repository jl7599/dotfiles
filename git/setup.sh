#!/bin/bash
#
# Setup git config on Ubuntu system

set -e

if [ -f "${CACHE_DIR}/.git" ]; then
    echo "Git has been configured successfully."
    exit 0
fi

echo "Setup git ..."
if [ -f "~/.gitconfig" ]; then
    mv ~/.gitconfig ~/.gitconfig.user
else
    touch ~/.gitconfig
fi
cp ./git/gitconfig ~/.gitconfig
touch ${CACHE_DIR}/.git
echo "Setup git done."
