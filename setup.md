# Setup

## Home & Terminal

```bash
# run me under `dotfiles` directory

if [[ "$BASH_SOURCE" == /* ]]; then
    TOP=$(realpath $(dirname $BASH_SOURCE))
else
    TOP=$(realpath $(pwd)/$(dirname $BASH_SOURCE))
fi

rmdir --ignore-fail-on-non-empty $HOME/{Documents,Movie,Music,Pictures,Public,Videos}

mkdir -p $HOME/bin

cat >> $HOME/.bashrc << EOF
. $TOP/setup.d/bash/alias.sh
. $TOP/setup.d/bash/ps1.sh
EOF

cat >> $HOME/.inputrc << EOF
# do not bell on tab-completion
set bell-style none
EOF

sudo apt-get update
sudo apt-get install -y \
    apt aptitude \
    wget curl axel \
    p7zip-full zip rar unrar \
    ascii tree

# vim
sudo apt-get install -y vim
ln -snf $TOP/setup.d/x.vimrc $HOME/.vimrc

# tmux
sudo apt-get install -y tmux
ln -snf $TOP/setup.d/x.tmux.conf $HOME/.tmux.conf

# ssh
sudo apt-get install -y ssh
mkdir -p $HOME/.ssh
ln -snf $TOP/setup.d/x.ssh_config $HOME/.ssh/config

# git
sudo apt-get install -y git
ln -snf $TOP/setup.d/x.gitconfig $HOME/.gitconfig
```

## 输入法fcitx

从软件管理器中安装`fcitx`，并添加`fcitx-table-wbpy` `fcitx-googlepinyin`。

将输入法唤醒快捷键设为`Ctrl_R`。

将`CapsLock`映射为`Ctrl_R`。

- edit `/usr/share/X11/xkb/symbols/pc`
  - `key <CAPS> { [ Control_R, Caps_Lock ] };`
- reboot

## Chrome

应从软件管理器安装。

若从命令行安装，需要

1) 添加签名 https://www.google.com/linuxrepositories/
2) 添加源
3) `sudo apt update`
4) `sudo apt install google-chrome-stable`

也可从[官网](https://www.google.com/intl/zh-HK/chrome/)下载后使用`dpkg`直接安装 [google-chrome-stable](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)

之后，不要忘记[ZeroOmega](https://chromewebstore.google.com/detail/proxy-switchyomega-3-zero/pfnededegaaopdmhkdmcofjmoldfiped)

## 多媒体

```bash
sudo apt-get install -y ffmpeg vlc
```

## Coding

### vscode

软件管理器

### java sdk

```bash
sudo apt-get install -y openjdk-8-jdk openjdk-8-source

cat >> $HOME/.bashrc << EOF

# jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
```

### nodejs

[安装nvm](https://github.com/nvm-sh/nvm#install--update-script)后，新开terminal再安装nodejs

```bash
nvm install --lts
```
