FROM ubuntu:trusty
RUN apt-get -qq update
RUN apt-get -qq -y install wget
ADD download_data.sh /usr/local/bin/download_data.sh
VOLUME /wdir
WORKDIR /wdir
CMD download_data.sh
