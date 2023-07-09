#!/bin/bash

if ! command -v zsh &> /dev/null
then
    sudo apt install zsh
else
    echo "Skip ZSH install"
fi

chsh -s $(which zsh)

if ! command -v starship &> /dev/null
then
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Skip Starship install"
fi

if ! command -v macchina &> /dev/null
then
    cargo install macchina
else
    echo "Skip Macchina install"
fi

if ! command -v exa &> /dev/null
then
    cargo install exa
else
    echo "Skip Exa install"
fi

if ! command -v ranger &> /dev/null
then
    sudo apt install ranger
else
    echo "Skip ranger install"
fi

if ! command -v fzf &> /dev/null
then
    sudo apt install fzf
else
    echo "Skip fzf install"
fi

#    _____   _   _
#   / ____| (_) | |
#  | |  __   _  | |_
#  | | |_ | | | | __|
#  | |__| | | | | |_
#   \_____| |_|  \__|
#

if ! command -v delta &> /dev/null
then
    cargo install git-delta
else
    echo "Skip Delta install"
fi

if ! command -v bat &> /dev/null
then
    sudo apt install bat
else
    echo "Skip Bat install"
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
