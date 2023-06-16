#!/usr/bin/env zsh


filerc=${1:-'~/.zshrc'} 

vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

cwd=$(pwd)
cd 
if ! command -v node &> /dev/null
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
    export NVM_DIR=$HOME/.nvm;
    . $NVM_DIR/nvm.sh;
    nvm install node;
else
    echo "Skipping node installation"
fi

if ! command -v cargo &> /dev/null
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    . "$HOME/.cargo/env"
else
    echo "Skipping cargo installation"
fi

if ! command -v rg &> /dev/null
then
    cargo install ripgrep
else
    echo "Skipping ripgrep installation"
fi

if ! command -v lua &> /dev/null
then
    curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz
    tar zxf lua-5.4.4.tar.gz
    rm zxf lua-5.4.4.tar.gz
    cd lua-5.4.4
    make all test
    echo "alias lua="~/lua-5.4.4/src/lua"" >> $filerc
else
    echo "Skipping lua installation"
fi

cd

# Installing go
wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
tar zxf go1.20.2.linux-amd64.tar.gz
rm go1.20.2.linux-amd64.tar.gz
echo "alias go="~/go/bin/go"">> $filerc
~/go/bin/go install github.com/mattn/efm-langserver@latest
echo "alias efm-langserver="~/go/bin/efm-langserver"">> $filerc


if command -v nvim &> /dev/null
then
    nvim_ver=$(nvim --version | grep "v[0-9]" | cut -f2 -d"v")
    vercomp "$nvim_ver" 0.9.0
    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac
    echo "$op"
    if [[ "$op" == '<' ]]
    then
        if command -v brew &> /dev/null
        then
            brew install neovim
        else
            wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
            tar xf nvim-linux64.tar.gz
            rm nvim-linux64.tar.gz
        fi
        echo "alias vim="$(command -v nvim)"" >> $filerc
    else
        echo "Correct nvim version is already installed"
    fi
else
    if command -v brew &> /dev/null
    then
        brew install neovim
    else
        wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
        tar xf nvim-linux64.tar.gz
        rm nvim-linux64.tar.gz
    fi
    echo "alias vim="$(command -v nvim)"" >> $filerc
fi

npm install -g prettier

