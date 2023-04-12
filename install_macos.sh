#!/bin/bash

#  _______                      _                _ 
# |__   __|                    (_)              | |
#    | |  ___  _ __  _ __ ___   _  _ __    __ _ | |
#    | | / _ \| '__|| '_ ` _ \ | || '_ \  / _` || |
#    | ||  __/| |   | | | | | || || | | || (_| || |
#    |_| \___||_|   |_| |_| |_||_||_| |_| \__,_||_|
#                                                   

if ! command -v kitty &> /dev/null
then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        launch=n
else
    echo "Skip Kitty install"
fi

if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Skip Brew install"
fi

if ! command -v zsh &> /dev/null
then
    echo brew install zsh
else
    echo "Skip ZSH install"
fi

if [ $(uname -p) == 'arm' ];
then
    echo chsh -s /opt/homebrew/bin/zsh
else
    echo chsh -s /usr/local/bin/zsh
fi

if ! command -v starship &> /dev/null
then
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Skip Starship install"
fi

if ! command -v macchina &> /dev/null
then
    brew install macchina
else
    echo "Skip Macchina install"
fi

if ! command -v exa &> /dev/null
then
    brew install exa
else
    echo "Skip Exa install"
fi

if ! command -v ranger &> /dev/null
then
    brew install ranger
else
    echo "Skip ranger install"
fi

if ! command -v fzf &> /dev/null
then
    brew install fzf

    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install
else
    echo "Ski[ fzf install"
fi

# __     __     _             _ 
# \ \   / /    | |           (_)
#  \ \_/ /__ _ | |__    __ _  _ 
#   \   // _` || '_ \  / _` || |
#    | || (_| || |_) || (_| || |
#    |_| \__,_||_.__/  \__,_||_|
#                               

if ! command -v yabai &> /dev/null
then
    brew install koekeishiya/formulae/yabai
    brew install koekeishiya/formulae/skhd
else
    echo "Skip Yabai install"
fi

# start yabai
brew services start yabai
brew services start skhd

#    _____   _   _   
#   / ____| (_) | |  
#  | |  __   _  | |_ 
#  | | |_ | | | | __|
#  | |__| | | | | |_ 
#   \_____| |_|  \__|
#                   

if ! command -v delta &> /dev/null
then
    brew install git-delta
else
    echo "Skip Delta install"
fi

if ! command -v bat &> /dev/null
then
    brew install bat
else
    echo "Skip Bat install"
fi
