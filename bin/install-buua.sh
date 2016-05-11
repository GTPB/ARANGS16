#!/bin/sh

#apt-get update
apt-get install -y wget tar build-essential

# this script downloads the BWA programming for mapping short reads to a reference
wget -O ../src/bwa-0.7.12.tar.bz2 http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2/download

#unzip and untar
tar -jxvf bwa-0.7.12.tar.bz2

#change dir
cd bwa-0.7.12

# build the program
make

#link the exec
ln -s $PWD/bwa /usr/local/bin/bwa


