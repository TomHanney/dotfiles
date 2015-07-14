#! /bin/bash

bash/setup.sh

base_dir=$(pwd)
echo $base_dir

cd ~
cp -sb $base_dir/vim/.vimrc .vimrc

if [ ! -d .vim ]; then
    mkdir .vim
fi

cp -sbr $base_dir/vim/.vim/* .vim/

if [ ! -d .vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cd -
