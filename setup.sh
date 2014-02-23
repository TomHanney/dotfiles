#! /bin/bash

base_dir=$(pwd)
echo $base_dir

cd ~
cp -sb $base_dir/bash/.* .
cp -sbr $base_dir/vim/.* .

cd -
