#!/bin/sh

# apt-get update
apt-get install -y wget bzip2 tar build-essential zlib1g-dev

# download bwa
wget http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2

# unzip and untar bwa
tar -jxvf bwa-0.7.12.tar.bz2

# change into directory
cd bwa-0.7.12

# build the program
make

# make symlink to executable
ln -s $PWD/bwa /usr/local/bin/bwa



