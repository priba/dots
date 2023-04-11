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

if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Skip OH MY ZSH install"
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

if ! command -v delta &> /dev/null
then
    brew install git-delta
else
    echo "Skip Delta install"
fi
