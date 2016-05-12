FROM ubuntu:trusty
RUN apt-get -qq update
RUN apt-get -qq -y install wget
WORKDIR /wdir
RUN wget -O /wdir/ERR022523_1.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_1.fastq.gz
RUN wget -O /wdir/ERR022523_2.fastq.gz ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022523/ERR022523_2.fastq.gz
RUN wget -O /wdir/Pf3D7_v2.1.5.fasta ftp://ftp.sanger.ac.uk/pub/project/pathogens/Plasmodium/falciparum/3D7/3D7.version2.1.5/Pf3D7_v2.1.5.fasta
#VOLUME /wdir
