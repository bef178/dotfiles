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

. $TOP/setup.d/alias.sh
. $TOP/setup.d/ps1.sh

export PATH=$PATH:$HOME/bin
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

```bash
# for wsl
if [[ `uname -a` == *Microsoft* ]]; then
    umask 022
    export WIN_USER=`cmd.exe /C "echo %USERNAME%" | tr -d '\r'`
    export WIN_HOME=/mnt/c/Users/$WIN_USER
    rmdir --ignore-fail-on-non-empty $HOME/Downloads
    ln -snf "${WIN_HOME}/Downloads" $HOME/Downloads
fi
```

```bash
# for mac
if [[ `uname -a` == *Darwin* ]]; then
    brew install \
        coreutils gnu-tar gnu-sed \
        findutils grep \
        gawk gnutls gnu-indent gnu-getopt

    brew install \
        bash-completion docker-completion pip-completion

    brew install \
        wget curl axel \
        p7zip zip rar unrar \
        ascii tree

    brew install vim
    ln -snf $TOP/setup.d/x.vimrc $HOME/.vimrc

    brew install tmux
    ln -snf $TOP/setup.d/x.tmux.conf $HOME/.tmux.conf

    brew install git
    ln -snf $TOP/setup.d/x.gitconfig $HOME/.gitconfig

    brew install openssh
    mkdir -p $HOME/.ssh
    ln -snf $TOP/setup.d/x.ssh_config $HOME/.ssh/config

    cat >> $HOME/.bashrc << EOF

export PATH=$PATH:$HOME/bin
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH
EOF
fi
```

## 输入法fcitx

1. 安装fcitx
    ```bash
    sudo apt-get install -y \
        fcitx fcitx-table-wbpy
    ```
1. 将系统输入法设为fcitx
    ```
    im-config
    ```
1. 在fcitx内添加五笔拼音
1. 将fcitx唤醒快捷键设为`Ctrl_R`
1. 将`CapsLock`映射为`Ctrl_R`
    ```bash
    vim /usr/share/X11/xkb/symbols/pc
    #    key <CAPS> { [ Control_R, Caps_Lock ] };
    reboot
    ```

## Chrome

https://www.google.com/chrome/

之后，不要忘记 [ZeroOmega](https://chromewebstore.google.com/detail/proxy-switchyomega-3-zero/pfnededegaaopdmhkdmcofjmoldfiped)

## 多媒体

```bash
sudo apt-get install -y ffmpeg vlc
```

## Coding

### vscode

https://code.visualstudio.com/docs/setup/linux

设置 Keyboard Shortcuts

| Function | Key |
| :- | :- |
| Copy | Win+C |
| Paste | Win+V |
| Delete All Left | Ctrl+U |
| Delete Line | Ctrl+D |
| Toggle Line Comment | Ctrl+/ |
| Trigger Suggest | Ctrl+P |
| renameFile | F2 |
| Remove Line Comment | (clear) |

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

安装nvm https://github.com/nvm-sh/nvm#install--update-script

之后，新开terminal安装nodejs

```bash
nvm install --lts
```
