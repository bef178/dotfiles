#!/bin/bash

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE)/..)
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE)/..)
fi

sudo apt-get update

sudo apt-get install -y apt aptitude

sudo apt-get install -y axel rar unrar testdisk tree p7zip-full ascii

sudo apt-get install -y astyle expect

sudo apt-get install -y ffmpeg

# vim
sudo apt-get install -y vim
ln -snf $TOP/res/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim
ln -snf $TOP/res/vim/colors $HOME/.vim/colors

# tmux
sudo apt-get install -y tmux
ln -snf $TOP/res/tmux.conf $HOME/.tmux.conf

# git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
ln -snf $TOP/res/gitconfig $HOME/.gitconfig

# azure cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
sudo apt-get install lsb-release
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" \
     | sudo tee /etc/apt/sources.list.d/azure-cli.list
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install azure-cli
# az login
