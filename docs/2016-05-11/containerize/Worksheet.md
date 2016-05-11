Containerizing 
--------------
We are going to try to get `bwa` and `samtools` to run as docker applications.
The end goal here is that we can run the modified pipeline.sh on the host
such that it invokes `docker run [IMAGE] bwa [ARGUMENTS]` and 
`docker run [IMAGE] samtools [ARGUMENTS]`. Hence, the steps would be
something like:

- pick a base image that makes sense, such as ubuntu:trusty, and log in on it.
  _`docker run -t -i -v /home/participant/arangs2016:/arangs ubuntu:trusty /bin/bash`, this
  way I have access to all the existing scripts._
- install any packages that are missing before you can compile. On ubuntu
  this would be `build-essential`, `ncurses-dev` and `zlib1g-dev`. _apt-get update && apt-get install build-essential zlib1g-dev ncurses-dev_
- make sure your container has access to the unpacked source folders for bwa/samtools.
  _I did download_samtools.sh and download_bwa.sh on the host, which means the 
  downloads end up in /arangs/src on the guest. Then `bunzip2 *.bz2` and `tar xvf ...` on each of the tar files._
- you should now be able to run `make` inside the container, and copy the
  resulting binary to somewhere in the path of the container, such as `/usr/local/bin`.
- modify the pipeline.sh so that it invokes `docker run ...` rather than bwa/samtools
  directly. 
