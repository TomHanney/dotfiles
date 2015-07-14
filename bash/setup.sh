#! /bin/bash

base_dir=$(pwd)

cd ~

ln -sb $base_dir/bash/.bashrc .bashrc

if [ ! -d ~/.bash ]; then
    mkdir .bash
fi

ln -sb $base_dir/bash/.bash/.bash_aliases .bash/.bash_aliases
ln -sb $base_dir/bash/.bash/.bash_header .bash/.bash_header

## Create .bashcfg - used by .bash_aliases
function bashcfg {
    echo $1 >> .bash/.bashcfg
}

if [ ! -f ~/.bash/.bashcfg ]; then
    bashcfg "export TODO_DIR='/media/tom/hd/dotfiles/script/todo.txt_cli-2.9'"
    bashcfg "export PYCHARM_DIR='/home/tom/software/pycharm-community-3.4.1/bin/'"
    bashcfg "export ANDROID_STUDIO_DIR='/home/tom/software/android-studio/bin/'"
    bashcfg "export YPM_DIR='/media/tom/hd/dev/haskell/yahoo/.cabal-sandbox/bin/'"
    bashcfg "export HD='/media/tom/hd'"
fi

cd -
