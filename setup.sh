#! /bin/bash

bash/setup.sh

base_dir=$(pwd)
echo $base_dir

cd ~
cp -sbr $base_dir/vim/.* .

cd -
