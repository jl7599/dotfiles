#!/bin/bash
#
# Setup zsh config on Ubuntu system

if [ -f "${CACHE_DIR}/.zsh" ]; then
    echo "Zsh has been configured successfully."
    exit 0
fi

echo "Setup zsh ..."

# Install zsh
which zsh > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "  Zsh already exists."
else
    echo "  Install zsh..."
    sudo apt-get install -y -q zsh
fi

# Install oh-my-zsh
if [ -d "/home/${USER}/.oh-my-zsh" ]; then
    echo "  Oh-my-zsh already exists."
else
    which wget > /dev/null 2>&1
        if [ ! $? -eq 0 ]; then
            sudo apt-get install -y -q wget
        fi
    echo "  Install oh-my-zsh"
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Config zsh
if [ -f "~/.zshrc" ]; then
    cp ~/.zshrc ~/.zshrc.bak
fi
cp ./zsh/zshrc ~/.zshrc

# Install plugins
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    echo "  Install zsh-syntax-highlighting..."
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    echo "  Install zsh-autosuggestions..."
    git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

touch ${CACHE_DIR}/.zsh
echo "Setup zsh done."
